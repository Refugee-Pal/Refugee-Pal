import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Translations4Record extends FirestoreRecord {
  Translations4Record._(
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
          ? parent.collection('translations4')
          : FirebaseFirestore.instance.collectionGroup('translations4');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('translations4').doc();

  static Stream<Translations4Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Translations4Record.fromSnapshot(s));

  static Future<Translations4Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Translations4Record.fromSnapshot(s));

  static Translations4Record fromSnapshot(DocumentSnapshot snapshot) =>
      Translations4Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Translations4Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Translations4Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Translations4Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Translations4Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTranslations4RecordData({
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

class Translations4RecordDocumentEquality
    implements Equality<Translations4Record> {
  const Translations4RecordDocumentEquality();

  @override
  bool equals(Translations4Record? e1, Translations4Record? e2) {
    return e1?.value == e2?.value && e1?.language == e2?.language;
  }

  @override
  int hash(Translations4Record? e) =>
      const ListEquality().hash([e?.value, e?.language]);

  @override
  bool isValidKey(Object? o) => o is Translations4Record;
}
