import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'translations2_record.g.dart';

abstract class Translations2Record
    implements Built<Translations2Record, Translations2RecordBuilder> {
  static Serializer<Translations2Record> get serializer =>
      _$translations2RecordSerializer;

  String? get value;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(Translations2RecordBuilder builder) =>
      builder..value = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('translations2')
          : FirebaseFirestore.instance.collectionGroup('translations2');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('translations2').doc();

  static Stream<Translations2Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<Translations2Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  Translations2Record._();
  factory Translations2Record(
          [void Function(Translations2RecordBuilder) updates]) =
      _$Translations2Record;

  static Translations2Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTranslations2RecordData({
  String? value,
}) {
  final firestoreData = serializers.toFirestore(
    Translations2Record.serializer,
    Translations2Record(
      (t) => t..value = value,
    ),
  );

  return firestoreData;
}
