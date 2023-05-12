import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'translations14_record.g.dart';

abstract class Translations14Record
    implements Built<Translations14Record, Translations14RecordBuilder> {
  static Serializer<Translations14Record> get serializer =>
      _$translations14RecordSerializer;

  String? get value;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(Translations14RecordBuilder builder) =>
      builder..value = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('translations14')
          : FirebaseFirestore.instance.collectionGroup('translations14');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('translations14').doc();

  static Stream<Translations14Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<Translations14Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  Translations14Record._();
  factory Translations14Record(
          [void Function(Translations14RecordBuilder) updates]) =
      _$Translations14Record;

  static Translations14Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTranslations14RecordData({
  String? value,
}) {
  final firestoreData = serializers.toFirestore(
    Translations14Record.serializer,
    Translations14Record(
      (t) => t..value = value,
    ),
  );

  return firestoreData;
}
