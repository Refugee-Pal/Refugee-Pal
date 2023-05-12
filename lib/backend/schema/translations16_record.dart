import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'translations16_record.g.dart';

abstract class Translations16Record
    implements Built<Translations16Record, Translations16RecordBuilder> {
  static Serializer<Translations16Record> get serializer =>
      _$translations16RecordSerializer;

  String? get value;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(Translations16RecordBuilder builder) =>
      builder..value = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('translations16')
          : FirebaseFirestore.instance.collectionGroup('translations16');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('translations16').doc();

  static Stream<Translations16Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<Translations16Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  Translations16Record._();
  factory Translations16Record(
          [void Function(Translations16RecordBuilder) updates]) =
      _$Translations16Record;

  static Translations16Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTranslations16RecordData({
  String? value,
}) {
  final firestoreData = serializers.toFirestore(
    Translations16Record.serializer,
    Translations16Record(
      (t) => t..value = value,
    ),
  );

  return firestoreData;
}
