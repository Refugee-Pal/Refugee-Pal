import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'translations3_record.g.dart';

abstract class Translations3Record
    implements Built<Translations3Record, Translations3RecordBuilder> {
  static Serializer<Translations3Record> get serializer =>
      _$translations3RecordSerializer;

  String? get value;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(Translations3RecordBuilder builder) =>
      builder..value = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('translations3')
          : FirebaseFirestore.instance.collectionGroup('translations3');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('translations3').doc();

  static Stream<Translations3Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<Translations3Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  Translations3Record._();
  factory Translations3Record(
          [void Function(Translations3RecordBuilder) updates]) =
      _$Translations3Record;

  static Translations3Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTranslations3RecordData({
  String? value,
}) {
  final firestoreData = serializers.toFirestore(
    Translations3Record.serializer,
    Translations3Record(
      (t) => t..value = value,
    ),
  );

  return firestoreData;
}
