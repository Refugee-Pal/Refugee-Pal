import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'translations8_record.g.dart';

abstract class Translations8Record
    implements Built<Translations8Record, Translations8RecordBuilder> {
  static Serializer<Translations8Record> get serializer =>
      _$translations8RecordSerializer;

  String? get value;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(Translations8RecordBuilder builder) =>
      builder..value = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('translations8')
          : FirebaseFirestore.instance.collectionGroup('translations8');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('translations8').doc();

  static Stream<Translations8Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<Translations8Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  Translations8Record._();
  factory Translations8Record(
          [void Function(Translations8RecordBuilder) updates]) =
      _$Translations8Record;

  static Translations8Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTranslations8RecordData({
  String? value,
}) {
  final firestoreData = serializers.toFirestore(
    Translations8Record.serializer,
    Translations8Record(
      (t) => t..value = value,
    ),
  );

  return firestoreData;
}
