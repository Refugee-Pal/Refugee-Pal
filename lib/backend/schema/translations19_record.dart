import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'translations19_record.g.dart';

abstract class Translations19Record
    implements Built<Translations19Record, Translations19RecordBuilder> {
  static Serializer<Translations19Record> get serializer =>
      _$translations19RecordSerializer;

  String? get value;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(Translations19RecordBuilder builder) =>
      builder..value = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('translations19')
          : FirebaseFirestore.instance.collectionGroup('translations19');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('translations19').doc();

  static Stream<Translations19Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<Translations19Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  Translations19Record._();
  factory Translations19Record(
          [void Function(Translations19RecordBuilder) updates]) =
      _$Translations19Record;

  static Translations19Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTranslations19RecordData({
  String? value,
}) {
  final firestoreData = serializers.toFirestore(
    Translations19Record.serializer,
    Translations19Record(
      (t) => t..value = value,
    ),
  );

  return firestoreData;
}
