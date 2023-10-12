import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "lastmessage" field.
  String? _lastmessage;
  String get lastmessage => _lastmessage ?? '';
  bool hasLastmessage() => _lastmessage != null;

  // "lastmessagetime" field.
  DateTime? _lastmessagetime;
  DateTime? get lastmessagetime => _lastmessagetime;
  bool hasLastmessagetime() => _lastmessagetime != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "users" field.
  List<String>? _users;
  List<String> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "lastmessageuser" field.
  String? _lastmessageuser;
  String get lastmessageuser => _lastmessageuser ?? '';
  bool hasLastmessageuser() => _lastmessageuser != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "categories" field.
  List<String>? _categories;
  List<String> get categories => _categories ?? const [];
  bool hasCategories() => _categories != null;

  // "preexistingTimestamps" field.
  List<String>? _preexistingTimestamps;
  List<String> get preexistingTimestamps => _preexistingTimestamps ?? const [];
  bool hasPreexistingTimestamps() => _preexistingTimestamps != null;

  void _initializeFields() {
    _lastmessage = snapshotData['lastmessage'] as String?;
    _lastmessagetime = snapshotData['lastmessagetime'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _users = getDataList(snapshotData['users']);
    _lastmessageuser = snapshotData['lastmessageuser'] as String?;
    _type = snapshotData['type'] as String?;
    _categories = getDataList(snapshotData['categories']);
    _preexistingTimestamps = getDataList(snapshotData['preexistingTimestamps']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? lastmessage,
  DateTime? lastmessagetime,
  String? name,
  String? lastmessageuser,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lastmessage': lastmessage,
      'lastmessagetime': lastmessagetime,
      'name': name,
      'lastmessageuser': lastmessageuser,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.lastmessage == e2?.lastmessage &&
        e1?.lastmessagetime == e2?.lastmessagetime &&
        e1?.name == e2?.name &&
        listEquality.equals(e1?.users, e2?.users) &&
        e1?.lastmessageuser == e2?.lastmessageuser &&
        e1?.type == e2?.type &&
        listEquality.equals(e1?.categories, e2?.categories) &&
        listEquality.equals(
            e1?.preexistingTimestamps, e2?.preexistingTimestamps);
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.lastmessage,
        e?.lastmessagetime,
        e?.name,
        e?.users,
        e?.lastmessageuser,
        e?.type,
        e?.categories,
        e?.preexistingTimestamps
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
