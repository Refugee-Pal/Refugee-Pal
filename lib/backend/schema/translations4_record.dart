import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'translations4_record.g.dart';

abstract class Translations4Record
    implements Built<Translations4Record, Translations4RecordBuilder> {
  static Serializer<Translations4Record> get serializer =>
      _$translations4RecordSerializer;

  String? get value;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(Translations4RecordBuilder builder) =>
      builder..value = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('translations4')
          : FirebaseFirestore.instance.collectionGroup('translations4');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('translations4').doc();

  static Stream<Translations4Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<Translations4Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  Translations4Record._();
  factory Translations4Record(
          [void Function(Translations4RecordBuilder) updates]) =
      _$Translations4Record;

  static Translations4Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTranslations4RecordData({
  String? value,
}) {
  final firestoreData = serializers.toFirestore(
    Translations4Record.serializer,
    Translations4Record(
      (t) => t..value = value,
    ),
  );

  return firestoreData;
}
