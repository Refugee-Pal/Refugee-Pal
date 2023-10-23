import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'translations1_record.g.dart';

abstract class Translations1Record
    implements Built<Translations1Record, Translations1RecordBuilder> {
  static Serializer<Translations1Record> get serializer =>
      _$translations1RecordSerializer;

  String? get value;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(Translations1RecordBuilder builder) =>
      builder..value = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('translations1')
          : FirebaseFirestore.instance.collectionGroup('translations1');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('translations1').doc();

  static Stream<Translations1Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<Translations1Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  Translations1Record._();
  factory Translations1Record(
          [void Function(Translations1RecordBuilder) updates]) =
      _$Translations1Record;

  static Translations1Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTranslations1RecordData({
  String? value,
}) {
  final firestoreData = serializers.toFirestore(
    Translations1Record.serializer,
    Translations1Record(
      (t) => t..value = value,
    ),
  );

  return firestoreData;
}
