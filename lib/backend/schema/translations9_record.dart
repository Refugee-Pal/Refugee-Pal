import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'translations9_record.g.dart';

abstract class Translations9Record
    implements Built<Translations9Record, Translations9RecordBuilder> {
  static Serializer<Translations9Record> get serializer =>
      _$translations9RecordSerializer;

  String? get value;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(Translations9RecordBuilder builder) =>
      builder..value = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('translations9')
          : FirebaseFirestore.instance.collectionGroup('translations9');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('translations9').doc();

  static Stream<Translations9Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<Translations9Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  Translations9Record._();
  factory Translations9Record(
          [void Function(Translations9RecordBuilder) updates]) =
      _$Translations9Record;

  static Translations9Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTranslations9RecordData({
  String? value,
}) {
  final firestoreData = serializers.toFirestore(
    Translations9Record.serializer,
    Translations9Record(
      (t) => t..value = value,
    ),
  );

  return firestoreData;
}
