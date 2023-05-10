import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'professionals_record.g.dart';

abstract class ProfessionalsRecord
    implements Built<ProfessionalsRecord, ProfessionalsRecordBuilder> {
  static Serializer<ProfessionalsRecord> get serializer =>
      _$professionalsRecordSerializer;

  String? get address;

  String? get language;

  String? get name;

  String? get profession;

  String? get registrationstatus;

  String? get mail;

  String? get website;

  int? get contact;

  String? get practicename;

  bool? get isIFHP;

  bool? get isFree;

  String? get profile;

  int? get views;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ProfessionalsRecordBuilder builder) => builder
    ..address = ''
    ..language = ''
    ..name = ''
    ..profession = ''
    ..registrationstatus = ''
    ..mail = ''
    ..website = ''
    ..contact = 0
    ..practicename = ''
    ..isIFHP = false
    ..isFree = false
    ..profile = ''
    ..views = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('professionals');

  static Stream<ProfessionalsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProfessionalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static ProfessionalsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ProfessionalsRecord(
        (c) => c
          ..address = snapshot.data['address']
          ..language = snapshot.data['language']
          ..name = snapshot.data['name']
          ..profession = snapshot.data['profession']
          ..registrationstatus = snapshot.data['registrationstatus']
          ..mail = snapshot.data['mail']
          ..website = snapshot.data['website']
          ..contact = snapshot.data['contact']?.round()
          ..practicename = snapshot.data['practicename']
          ..isIFHP = snapshot.data['isIFHP']
          ..isFree = snapshot.data['isFree']
          ..profile = snapshot.data['profile']
          ..views = snapshot.data['views']?.round()
          ..ffRef = ProfessionalsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ProfessionalsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'professionals',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  ProfessionalsRecord._();
  factory ProfessionalsRecord(
          [void Function(ProfessionalsRecordBuilder) updates]) =
      _$ProfessionalsRecord;

  static ProfessionalsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProfessionalsRecordData({
  String? address,
  String? language,
  String? name,
  String? profession,
  String? registrationstatus,
  String? mail,
  String? website,
  int? contact,
  String? practicename,
  bool? isIFHP,
  bool? isFree,
  String? profile,
  int? views,
}) {
  final firestoreData = serializers.toFirestore(
    ProfessionalsRecord.serializer,
    ProfessionalsRecord(
      (p) => p
        ..address = address
        ..language = language
        ..name = name
        ..profession = profession
        ..registrationstatus = registrationstatus
        ..mail = mail
        ..website = website
        ..contact = contact
        ..practicename = practicename
        ..isIFHP = isIFHP
        ..isFree = isFree
        ..profile = profile
        ..views = views,
    ),
  );

  return firestoreData;
}
