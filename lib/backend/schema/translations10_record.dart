import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'translations10_record.g.dart';

abstract class Translations10Record
    implements Built<Translations10Record, Translations10RecordBuilder> {
  static Serializer<Translations10Record> get serializer =>
      _$translations10RecordSerializer;

  String? get value;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(Translations10RecordBuilder builder) =>
      builder..value = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('translations10')
          : FirebaseFirestore.instance.collectionGroup('translations10');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('translations10').doc();

  static Stream<Translations10Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<Translations10Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  Translations10Record._();
  factory Translations10Record(
          [void Function(Translations10RecordBuilder) updates]) =
      _$Translations10Record;

  static Translations10Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTranslations10RecordData({
  String? value,
}) {
  final firestoreData = serializers.toFirestore(
    Translations10Record.serializer,
    Translations10Record(
      (t) => t..value = value,
    ),
  );

  return firestoreData;
}
