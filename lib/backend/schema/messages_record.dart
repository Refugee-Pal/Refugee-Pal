import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "user" field.
  String? _user;
  String get user => _user ?? '';
  bool hasUser() => _user != null;

  // "showName" field.
  bool? _showName;
  bool get showName => _showName ?? false;
  bool hasShowName() => _showName != null;

  // "showTime" field.
  bool? _showTime;
  bool get showTime => _showTime ?? false;
  bool hasShowTime() => _showTime != null;

  // "isAnswer" field.
  bool? _isAnswer;
  bool get isAnswer => _isAnswer ?? false;
  bool hasIsAnswer() => _isAnswer != null;

  // "imgPath" field.
  String? _imgPath;
  String get imgPath => _imgPath ?? '';
  bool hasImgPath() => _imgPath != null;

  // "videoPath" field.
  String? _videoPath;
  String get videoPath => _videoPath ?? '';
  bool hasVideoPath() => _videoPath != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _text = snapshotData['text'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _user = snapshotData['user'] as String?;
    _showName = snapshotData['showName'] as bool?;
    _showTime = snapshotData['showTime'] as bool?;
    _isAnswer = snapshotData['isAnswer'] as bool?;
    _imgPath = snapshotData['imgPath'] as String?;
    _videoPath = snapshotData['videoPath'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('messages')
          : FirebaseFirestore.instance.collectionGroup('messages');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('messages').doc();

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  String? text,
  DateTime? time,
  String? user,
  bool? showName,
  bool? showTime,
  bool? isAnswer,
  String? imgPath,
  String? videoPath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': text,
      'time': time,
      'user': user,
      'showName': showName,
      'showTime': showTime,
      'isAnswer': isAnswer,
      'imgPath': imgPath,
      'videoPath': videoPath,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    return e1?.text == e2?.text &&
        e1?.time == e2?.time &&
        e1?.user == e2?.user &&
        e1?.showName == e2?.showName &&
        e1?.showTime == e2?.showTime &&
        e1?.isAnswer == e2?.isAnswer &&
        e1?.imgPath == e2?.imgPath &&
        e1?.videoPath == e2?.videoPath;
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality().hash([
        e?.text,
        e?.time,
        e?.user,
        e?.showName,
        e?.showTime,
        e?.isAnswer,
        e?.imgPath,
        e?.videoPath
      ]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}
