import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubcategoryRecord extends FirestoreRecord {
  SubcategoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "information" field.
  String? _information;
  String get information => _information ?? '';
  bool hasInformation() => _information != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "views" field.
  int? _views;
  int get views => _views ?? 0;
  bool hasViews() => _views != null;

  void _initializeFields() {
    _category = snapshotData['category'] as String?;
    _information = snapshotData['information'] as String?;
    _name = snapshotData['name'] as String?;
    _views = castToType<int>(snapshotData['views']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subcategory');

  static Stream<SubcategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubcategoryRecord.fromSnapshot(s));

  static Future<SubcategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubcategoryRecord.fromSnapshot(s));

  static SubcategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubcategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubcategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubcategoryRecord._(reference, mapFromFirestore(data));

  static SubcategoryRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      SubcategoryRecord.getDocumentFromData(
        {
          'category': snapshot.data['category'],
          'information': snapshot.data['information'],
          'name': snapshot.data['name'],
          'views': convertAlgoliaParam(
            snapshot.data['views'],
            ParamType.int,
            false,
          ),
        },
        SubcategoryRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<SubcategoryRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'subcategory',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'SubcategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubcategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubcategoryRecordData({
  String? category,
  String? information,
  String? name,
  int? views,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
      'information': information,
      'name': name,
      'views': views,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubcategoryRecordDocumentEquality implements Equality<SubcategoryRecord> {
  const SubcategoryRecordDocumentEquality();

  @override
  bool equals(SubcategoryRecord? e1, SubcategoryRecord? e2) {
    return e1?.category == e2?.category &&
        e1?.information == e2?.information &&
        e1?.name == e2?.name &&
        e1?.views == e2?.views;
  }

  @override
  int hash(SubcategoryRecord? e) => const ListEquality()
      .hash([e?.category, e?.information, e?.name, e?.views]);

  @override
  bool isValidKey(Object? o) => o is SubcategoryRecord;
}
