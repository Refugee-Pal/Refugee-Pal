import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Translations7Record extends FirestoreRecord {
  Translations7Record._(
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
          ? parent.collection('translations7')
          : FirebaseFirestore.instance.collectionGroup('translations7');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('translations7').doc();

  static Stream<Translations7Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Translations7Record.fromSnapshot(s));

  static Future<Translations7Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Translations7Record.fromSnapshot(s));

  static Translations7Record fromSnapshot(DocumentSnapshot snapshot) =>
      Translations7Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Translations7Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Translations7Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Translations7Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Translations7Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTranslations7RecordData({
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

class Translations7RecordDocumentEquality
    implements Equality<Translations7Record> {
  const Translations7RecordDocumentEquality();

  @override
  bool equals(Translations7Record? e1, Translations7Record? e2) {
    return e1?.value == e2?.value && e1?.language == e2?.language;
  }

  @override
  int hash(Translations7Record? e) =>
      const ListEquality().hash([e?.value, e?.language]);

  @override
  bool isValidKey(Object? o) => o is Translations7Record;
}
