import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'translations11_record.g.dart';

abstract class Translations11Record
    implements Built<Translations11Record, Translations11RecordBuilder> {
  static Serializer<Translations11Record> get serializer =>
      _$translations11RecordSerializer;

  String? get value;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(Translations11RecordBuilder builder) =>
      builder..value = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('translations11')
          : FirebaseFirestore.instance.collectionGroup('translations11');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('translations11').doc();

  static Stream<Translations11Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<Translations11Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  Translations11Record._();
  factory Translations11Record(
          [void Function(Translations11RecordBuilder) updates]) =
      _$Translations11Record;

  static Translations11Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTranslations11RecordData({
  String? value,
}) {
  final firestoreData = serializers.toFirestore(
    Translations11Record.serializer,
    Translations11Record(
      (t) => t..value = value,
    ),
  );

  return firestoreData;
}
