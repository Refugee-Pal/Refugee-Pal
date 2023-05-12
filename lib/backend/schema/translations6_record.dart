import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'translations6_record.g.dart';

abstract class Translations6Record
    implements Built<Translations6Record, Translations6RecordBuilder> {
  static Serializer<Translations6Record> get serializer =>
      _$translations6RecordSerializer;

  String? get value;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(Translations6RecordBuilder builder) =>
      builder..value = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('translations6')
          : FirebaseFirestore.instance.collectionGroup('translations6');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('translations6').doc();

  static Stream<Translations6Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<Translations6Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  Translations6Record._();
  factory Translations6Record(
          [void Function(Translations6RecordBuilder) updates]) =
      _$Translations6Record;

  static Translations6Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTranslations6RecordData({
  String? value,
}) {
  final firestoreData = serializers.toFirestore(
    Translations6Record.serializer,
    Translations6Record(
      (t) => t..value = value,
    ),
  );

  return firestoreData;
}
