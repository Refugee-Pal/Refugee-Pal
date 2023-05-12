import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'translations15_record.g.dart';

abstract class Translations15Record
    implements Built<Translations15Record, Translations15RecordBuilder> {
  static Serializer<Translations15Record> get serializer =>
      _$translations15RecordSerializer;

  String? get value;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(Translations15RecordBuilder builder) =>
      builder..value = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('translations15')
          : FirebaseFirestore.instance.collectionGroup('translations15');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('translations15').doc();

  static Stream<Translations15Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<Translations15Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  Translations15Record._();
  factory Translations15Record(
          [void Function(Translations15RecordBuilder) updates]) =
      _$Translations15Record;

  static Translations15Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTranslations15RecordData({
  String? value,
}) {
  final firestoreData = serializers.toFirestore(
    Translations15Record.serializer,
    Translations15Record(
      (t) => t..value = value,
    ),
  );

  return firestoreData;
}
