import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Translations14Record extends FirestoreRecord {
  Translations14Record._(
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
          ? parent.collection('translations14')
          : FirebaseFirestore.instance.collectionGroup('translations14');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('translations14').doc();

  static Stream<Translations14Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Translations14Record.fromSnapshot(s));

  static Future<Translations14Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Translations14Record.fromSnapshot(s));

  static Translations14Record fromSnapshot(DocumentSnapshot snapshot) =>
      Translations14Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Translations14Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Translations14Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Translations14Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Translations14Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTranslations14RecordData({
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

class Translations14RecordDocumentEquality
    implements Equality<Translations14Record> {
  const Translations14RecordDocumentEquality();

  @override
  bool equals(Translations14Record? e1, Translations14Record? e2) {
    return e1?.value == e2?.value && e1?.language == e2?.language;
  }

  @override
  int hash(Translations14Record? e) =>
      const ListEquality().hash([e?.value, e?.language]);

  @override
  bool isValidKey(Object? o) => o is Translations14Record;
}
