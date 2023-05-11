import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'chats_record.g.dart';

abstract class ChatsRecord implements Built<ChatsRecord, ChatsRecordBuilder> {
  static Serializer<ChatsRecord> get serializer => _$chatsRecordSerializer;

  String? get lastmessage;

  DateTime? get lastmessagetime;

  String? get name;

  BuiltList<String>? get users;

  String? get lastmessageuser;

  String? get type;

  BuiltList<String>? get categories;

  BuiltList<String>? get preexistingTimestamps;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ChatsRecordBuilder builder) => builder
    ..lastmessage = ''
    ..name = ''
    ..users = ListBuilder()
    ..lastmessageuser = ''
    ..type = ''
    ..categories = ListBuilder()
    ..preexistingTimestamps = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ChatsRecord._();
  factory ChatsRecord([void Function(ChatsRecordBuilder) updates]) =
      _$ChatsRecord;

  static ChatsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createChatsRecordData({
  String? lastmessage,
  DateTime? lastmessagetime,
  String? name,
  String? lastmessageuser,
  String? type,
}) {
  final firestoreData = serializers.toFirestore(
    ChatsRecord.serializer,
    ChatsRecord(
      (c) => c
        ..lastmessage = lastmessage
        ..lastmessagetime = lastmessagetime
        ..name = name
        ..users = null
        ..lastmessageuser = lastmessageuser
        ..type = type
        ..categories = null
        ..preexistingTimestamps = null,
    ),
  );

  return firestoreData;
}
