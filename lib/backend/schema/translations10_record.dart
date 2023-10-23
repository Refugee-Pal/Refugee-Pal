import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Translations10Record extends FirestoreRecord {
  Translations10Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  bool hasValue() => _value != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _value = snapshotData['value'] as String?;
    _language = snapshotData['language'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('translations10')
          : FirebaseFirestore.instance.collectionGroup('translations10');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('translations10').doc();

  static Stream<Translations10Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Translations10Record.fromSnapshot(s));

  static Future<Translations10Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Translations10Record.fromSnapshot(s));

  static Translations10Record fromSnapshot(DocumentSnapshot snapshot) =>
      Translations10Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Translations10Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Translations10Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Translations10Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Translations10Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTranslations10RecordData({
  String? value,
  String? language,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'value': value,
      'language': language,
    }.withoutNulls,
  );

  return firestoreData;
}

class Translations10RecordDocumentEquality
    implements Equality<Translations10Record> {
  const Translations10RecordDocumentEquality();

  @override
  bool equals(Translations10Record? e1, Translations10Record? e2) {
    return e1?.value == e2?.value && e1?.language == e2?.language;
  }

  @override
  int hash(Translations10Record? e) =>
      const ListEquality().hash([e?.value, e?.language]);

  @override
  bool isValidKey(Object? o) => o is Translations10Record;
}
