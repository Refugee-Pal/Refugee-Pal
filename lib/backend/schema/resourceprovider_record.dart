import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'resourceprovider_record.g.dart';

abstract class ResourceproviderRecord
    implements Built<ResourceproviderRecord, ResourceproviderRecordBuilder> {
  static Serializer<ResourceproviderRecord> get serializer =>
      _$resourceproviderRecordSerializer;

  String? get name;

  String? get subcategory;

  String? get information;

  String? get link;

  int? get views;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ResourceproviderRecordBuilder builder) =>
      builder
        ..name = ''
        ..subcategory = ''
        ..information = ''
        ..link = ''
        ..views = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('resourceprovider');

  static Stream<ResourceproviderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ResourceproviderRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static ResourceproviderRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ResourceproviderRecord(
        (c) => c
          ..name = snapshot.data['name']
          ..subcategory = snapshot.data['subcategory']
          ..information = snapshot.data['information']
          ..link = snapshot.data['link']
          ..views = snapshot.data['views']?.round()
          ..ffRef = ResourceproviderRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ResourceproviderRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'resourceprovider',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  ResourceproviderRecord._();
  factory ResourceproviderRecord(
          [void Function(ResourceproviderRecordBuilder) updates]) =
      _$ResourceproviderRecord;

  static ResourceproviderRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createResourceproviderRecordData({
  String? name,
  String? subcategory,
  String? information,
  String? link,
  int? views,
}) {
  final firestoreData = serializers.toFirestore(
    ResourceproviderRecord.serializer,
    ResourceproviderRecord(
      (r) => r
        ..name = name
        ..subcategory = subcategory
        ..information = information
        ..link = link
        ..views = views,
    ),
  );

  return firestoreData;
}
