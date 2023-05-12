import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'translations5_record.g.dart';

abstract class Translations5Record
    implements Built<Translations5Record, Translations5RecordBuilder> {
  static Serializer<Translations5Record> get serializer =>
      _$translations5RecordSerializer;

  String? get value;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(Translations5RecordBuilder builder) =>
      builder..value = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('translations5')
          : FirebaseFirestore.instance.collectionGroup('translations5');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('translations5').doc();

  static Stream<Translations5Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<Translations5Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  Translations5Record._();
  factory Translations5Record(
          [void Function(Translations5RecordBuilder) updates]) =
      _$Translations5Record;

  static Translations5Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTranslations5RecordData({
  String? value,
}) {
  final firestoreData = serializers.toFirestore(
    Translations5Record.serializer,
    Translations5Record(
      (t) => t..value = value,
    ),
  );

  return firestoreData;
}
