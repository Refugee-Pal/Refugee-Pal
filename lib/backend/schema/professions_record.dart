import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'professions_record.g.dart';

abstract class ProfessionsRecord
    implements Built<ProfessionsRecord, ProfessionsRecordBuilder> {
  static Serializer<ProfessionsRecord> get serializer =>
      _$professionsRecordSerializer;

  String? get name;

  String? get icon;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ProfessionsRecordBuilder builder) => builder
    ..name = ''
    ..icon = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('professions');

  static Stream<ProfessionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProfessionsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static ProfessionsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ProfessionsRecord(
        (c) => c
          ..name = snapshot.data['name']
          ..icon = snapshot.data['icon']
          ..ffRef = ProfessionsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ProfessionsRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'professions',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  ProfessionsRecord._();
  factory ProfessionsRecord([void Function(ProfessionsRecordBuilder) updates]) =
      _$ProfessionsRecord;

  static ProfessionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProfessionsRecordData({
  String? name,
  String? icon,
}) {
  final firestoreData = serializers.toFirestore(
    ProfessionsRecord.serializer,
    ProfessionsRecord(
      (p) => p
        ..name = name
        ..icon = icon,
    ),
  );

  return firestoreData;
}
