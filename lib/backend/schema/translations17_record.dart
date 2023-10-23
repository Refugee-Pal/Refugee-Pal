import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'translations17_record.g.dart';

abstract class Translations17Record
    implements Built<Translations17Record, Translations17RecordBuilder> {
  static Serializer<Translations17Record> get serializer =>
      _$translations17RecordSerializer;

  String? get value;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(Translations17RecordBuilder builder) =>
      builder..value = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('translations17')
          : FirebaseFirestore.instance.collectionGroup('translations17');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('translations17').doc();

  static Stream<Translations17Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<Translations17Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  Translations17Record._();
  factory Translations17Record(
          [void Function(Translations17RecordBuilder) updates]) =
      _$Translations17Record;

  static Translations17Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTranslations17RecordData({
  String? value,
}) {
  final firestoreData = serializers.toFirestore(
    Translations17Record.serializer,
    Translations17Record(
      (t) => t..value = value,
    ),
  );

  return firestoreData;
}
