import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramsRecord extends FirestoreRecord {
  ProgramsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "people" field.
  List<String>? _people;
  List<String> get people => _people ?? const [];
  bool hasPeople() => _people != null;

  // "category" field.
  List<String>? _category;
  List<String> get category => _category ?? const [];
  bool hasCategory() => _category != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "dates" field.
  List<DateTime>? _dates;
  List<DateTime> get dates => _dates ?? const [];
  bool hasDates() => _dates != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  bool hasWebsite() => _website != null;

  // "imgPath" field.
  String? _imgPath;
  String get imgPath => _imgPath ?? '';
  bool hasImgPath() => _imgPath != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _people = getDataList(snapshotData['people']);
    _category = getDataList(snapshotData['category']);
    _type = snapshotData['type'] as String?;
    _description = snapshotData['description'] as String?;
    _dates = getDataList(snapshotData['dates']);
    _website = snapshotData['website'] as String?;
    _imgPath = snapshotData['imgPath'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('programs')
          : FirebaseFirestore.instance.collectionGroup('programs');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('programs').doc();

  static Stream<ProgramsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProgramsRecord.fromSnapshot(s));

  static Future<ProgramsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProgramsRecord.fromSnapshot(s));

  static ProgramsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProgramsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProgramsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProgramsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProgramsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProgramsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProgramsRecordData({
  String? name,
  String? type,
  String? description,
  String? website,
  String? imgPath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'type': type,
      'description': description,
      'website': website,
      'imgPath': imgPath,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProgramsRecordDocumentEquality implements Equality<ProgramsRecord> {
  const ProgramsRecordDocumentEquality();

  @override
  bool equals(ProgramsRecord? e1, ProgramsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.people, e2?.people) &&
        listEquality.equals(e1?.category, e2?.category) &&
        e1?.type == e2?.type &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.dates, e2?.dates) &&
        e1?.website == e2?.website &&
        e1?.imgPath == e2?.imgPath;
  }

  @override
  int hash(ProgramsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.people,
        e?.category,
        e?.type,
        e?.description,
        e?.dates,
        e?.website,
        e?.imgPath
      ]);

  @override
  bool isValidKey(Object? o) => o is ProgramsRecord;
}
