import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'translations7_record.g.dart';

abstract class Translations7Record
    implements Built<Translations7Record, Translations7RecordBuilder> {
  static Serializer<Translations7Record> get serializer =>
      _$translations7RecordSerializer;

  String? get value;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(Translations7RecordBuilder builder) =>
      builder..value = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('translations7')
          : FirebaseFirestore.instance.collectionGroup('translations7');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('translations7').doc();

  static Stream<Translations7Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<Translations7Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  Translations7Record._();
  factory Translations7Record(
          [void Function(Translations7RecordBuilder) updates]) =
      _$Translations7Record;

  static Translations7Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTranslations7RecordData({
  String? value,
}) {
  final firestoreData = serializers.toFirestore(
    Translations7Record.serializer,
    Translations7Record(
      (t) => t..value = value,
    ),
  );

  return firestoreData;
}
