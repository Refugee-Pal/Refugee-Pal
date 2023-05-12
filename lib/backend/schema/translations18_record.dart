import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'translations18_record.g.dart';

abstract class Translations18Record
    implements Built<Translations18Record, Translations18RecordBuilder> {
  static Serializer<Translations18Record> get serializer =>
      _$translations18RecordSerializer;

  String? get value;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(Translations18RecordBuilder builder) =>
      builder..value = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('translations18')
          : FirebaseFirestore.instance.collectionGroup('translations18');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('translations18').doc();

  static Stream<Translations18Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<Translations18Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  Translations18Record._();
  factory Translations18Record(
          [void Function(Translations18RecordBuilder) updates]) =
      _$Translations18Record;

  static Translations18Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTranslations18RecordData({
  String? value,
}) {
  final firestoreData = serializers.toFirestore(
    Translations18Record.serializer,
    Translations18Record(
      (t) => t..value = value,
    ),
  );

  return firestoreData;
}
