import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'languages_record.g.dart';

abstract class LanguagesRecord
    implements Built<LanguagesRecord, LanguagesRecordBuilder> {
  static Serializer<LanguagesRecord> get serializer =>
      _$languagesRecordSerializer;

  @BuiltValueField(wireName: 'Name')
  String? get name;

  String? get code;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(LanguagesRecordBuilder builder) => builder
    ..name = ''
    ..code = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('languages');

  static Stream<LanguagesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<LanguagesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  LanguagesRecord._();
  factory LanguagesRecord([void Function(LanguagesRecordBuilder) updates]) =
      _$LanguagesRecord;

  static LanguagesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createLanguagesRecordData({
  String? name,
  String? code,
}) {
  final firestoreData = serializers.toFirestore(
    LanguagesRecord.serializer,
    LanguagesRecord(
      (l) => l
        ..name = name
        ..code = code,
    ),
  );

  return firestoreData;
}
