import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'translations12_record.g.dart';

abstract class Translations12Record
    implements Built<Translations12Record, Translations12RecordBuilder> {
  static Serializer<Translations12Record> get serializer =>
      _$translations12RecordSerializer;

  String? get value;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(Translations12RecordBuilder builder) =>
      builder..value = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('translations12')
          : FirebaseFirestore.instance.collectionGroup('translations12');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('translations12').doc();

  static Stream<Translations12Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<Translations12Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  Translations12Record._();
  factory Translations12Record(
          [void Function(Translations12RecordBuilder) updates]) =
      _$Translations12Record;

  static Translations12Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTranslations12RecordData({
  String? value,
}) {
  final firestoreData = serializers.toFirestore(
    Translations12Record.serializer,
    Translations12Record(
      (t) => t..value = value,
    ),
  );

  return firestoreData;
}
