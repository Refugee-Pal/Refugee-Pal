import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'translations13_record.g.dart';

abstract class Translations13Record
    implements Built<Translations13Record, Translations13RecordBuilder> {
  static Serializer<Translations13Record> get serializer =>
      _$translations13RecordSerializer;

  String? get value;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(Translations13RecordBuilder builder) =>
      builder..value = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('translations13')
          : FirebaseFirestore.instance.collectionGroup('translations13');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('translations13').doc();

  static Stream<Translations13Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<Translations13Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  Translations13Record._();
  factory Translations13Record(
          [void Function(Translations13RecordBuilder) updates]) =
      _$Translations13Record;

  static Translations13Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTranslations13RecordData({
  String? value,
}) {
  final firestoreData = serializers.toFirestore(
    Translations13Record.serializer,
    Translations13Record(
      (t) => t..value = value,
    ),
  );

  return firestoreData;
}
