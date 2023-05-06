import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'locations_record.g.dart';

abstract class LocationsRecord
    implements Built<LocationsRecord, LocationsRecordBuilder> {
  static Serializer<LocationsRecord> get serializer =>
      _$locationsRecordSerializer;

  String? get name;

  String? get address;

  String? get type;

  String? get description;

  String? get website;

  String? get directions;

  String? get mail;

  int? get phone;

  LatLng? get coordinates;

  BuiltList<String>? get bullet;

  BuiltList<String>? get category;

  String? get imgPath;

  String? get organization;

  BuiltList<String>? get people;

  int? get views;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(LocationsRecordBuilder builder) => builder
    ..name = ''
    ..address = ''
    ..type = ''
    ..description = ''
    ..website = ''
    ..directions = ''
    ..mail = ''
    ..phone = 0
    ..bullet = ListBuilder()
    ..category = ListBuilder()
    ..imgPath = ''
    ..organization = ''
    ..people = ListBuilder()
    ..views = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('locations');

  static Stream<LocationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<LocationsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static LocationsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      LocationsRecord(
        (c) => c
          ..name = snapshot.data['name']
          ..address = snapshot.data['address']
          ..type = snapshot.data['type']
          ..description = snapshot.data['description']
          ..website = snapshot.data['website']
          ..directions = snapshot.data['directions']
          ..mail = snapshot.data['mail']
          ..phone = snapshot.data['phone']?.round()
          ..coordinates = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..bullet = safeGet(() => ListBuilder(snapshot.data['bullet']))
          ..category = safeGet(() => ListBuilder(snapshot.data['category']))
          ..imgPath = snapshot.data['imgPath']
          ..organization = snapshot.data['organization']
          ..people = safeGet(() => ListBuilder(snapshot.data['people']))
          ..views = snapshot.data['views']?.round()
          ..ffRef = LocationsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<LocationsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'locations',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  LocationsRecord._();
  factory LocationsRecord([void Function(LocationsRecordBuilder) updates]) =
      _$LocationsRecord;

  static LocationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createLocationsRecordData({
  String? name,
  String? address,
  String? type,
  String? description,
  String? website,
  String? directions,
  String? mail,
  int? phone,
  LatLng? coordinates,
  String? imgPath,
  String? organization,
  int? views,
}) {
  final firestoreData = serializers.toFirestore(
    LocationsRecord.serializer,
    LocationsRecord(
      (l) => l
        ..name = name
        ..address = address
        ..type = type
        ..description = description
        ..website = website
        ..directions = directions
        ..mail = mail
        ..phone = phone
        ..coordinates = coordinates
        ..bullet = null
        ..category = null
        ..imgPath = imgPath
        ..organization = organization
        ..people = null
        ..views = views,
    ),
  );

  return firestoreData;
}
