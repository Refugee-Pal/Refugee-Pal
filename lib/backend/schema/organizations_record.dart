import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'organizations_record.g.dart';

abstract class OrganizationsRecord
    implements Built<OrganizationsRecord, OrganizationsRecordBuilder> {
  static Serializer<OrganizationsRecord> get serializer =>
      _$organizationsRecordSerializer;

  String? get name;

  BuiltList<String>? get people;

  String? get logoPath;

  String? get description;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(OrganizationsRecordBuilder builder) => builder
    ..name = ''
    ..people = ListBuilder()
    ..logoPath = ''
    ..description = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('organizations');

  static Stream<OrganizationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OrganizationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OrganizationsRecord._();
  factory OrganizationsRecord(
          [void Function(OrganizationsRecordBuilder) updates]) =
      _$OrganizationsRecord;

  static OrganizationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOrganizationsRecordData({
  String? name,
  String? logoPath,
  String? description,
}) {
  final firestoreData = serializers.toFirestore(
    OrganizationsRecord.serializer,
    OrganizationsRecord(
      (o) => o
        ..name = name
        ..people = null
        ..logoPath = logoPath
        ..description = description,
    ),
  );

  return firestoreData;
}
