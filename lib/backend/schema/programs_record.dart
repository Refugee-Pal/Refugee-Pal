import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'programs_record.g.dart';

abstract class ProgramsRecord
    implements Built<ProgramsRecord, ProgramsRecordBuilder> {
  static Serializer<ProgramsRecord> get serializer =>
      _$programsRecordSerializer;

  String? get name;

  BuiltList<String>? get people;

  BuiltList<String>? get category;

  String? get type;

  String? get description;

  BuiltList<DateTime>? get dates;

  String? get website;

  String? get imgPath;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(ProgramsRecordBuilder builder) => builder
    ..name = ''
    ..people = ListBuilder()
    ..category = ListBuilder()
    ..type = ''
    ..description = ''
    ..dates = ListBuilder()
    ..website = ''
    ..imgPath = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('programs')
          : FirebaseFirestore.instance.collectionGroup('programs');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('programs').doc();

  static Stream<ProgramsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProgramsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ProgramsRecord._();
  factory ProgramsRecord([void Function(ProgramsRecordBuilder) updates]) =
      _$ProgramsRecord;

  static ProgramsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProgramsRecordData({
  String? name,
  String? type,
  String? description,
  String? website,
  String? imgPath,
}) {
  final firestoreData = serializers.toFirestore(
    ProgramsRecord.serializer,
    ProgramsRecord(
      (p) => p
        ..name = name
        ..people = null
        ..category = null
        ..type = type
        ..description = description
        ..dates = null
        ..website = website
        ..imgPath = imgPath,
    ),
  );

  return firestoreData;
}
