import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfessionsRecord extends FirestoreRecord {
  ProfessionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  // "translated" field.
  List<String>? _translated;
  List<String> get translated => _translated ?? const [];
  bool hasTranslated() => _translated != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _icon = snapshotData['icon'] as String?;
    _translated = getDataList(snapshotData['translated']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('professions');

  static Stream<ProfessionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProfessionsRecord.fromSnapshot(s));

  static Future<ProfessionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProfessionsRecord.fromSnapshot(s));

  static ProfessionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProfessionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProfessionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProfessionsRecord._(reference, mapFromFirestore(data));

  static ProfessionsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ProfessionsRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'icon': snapshot.data['icon'],
          'translated': safeGet(
            () => snapshot.data['translated'].toList(),
          ),
        },
        ProfessionsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ProfessionsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'professions',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ProfessionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProfessionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProfessionsRecordData({
  String? name,
  String? icon,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'icon': icon,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProfessionsRecordDocumentEquality implements Equality<ProfessionsRecord> {
  const ProfessionsRecordDocumentEquality();

  @override
  bool equals(ProfessionsRecord? e1, ProfessionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.icon == e2?.icon &&
        listEquality.equals(e1?.translated, e2?.translated);
  }

  @override
  int hash(ProfessionsRecord? e) =>
      const ListEquality().hash([e?.name, e?.icon, e?.translated]);

  @override
  bool isValidKey(Object? o) => o is ProfessionsRecord;
}
