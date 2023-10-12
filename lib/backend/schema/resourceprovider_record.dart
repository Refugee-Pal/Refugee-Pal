import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResourceproviderRecord extends FirestoreRecord {
  ResourceproviderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "subcategory" field.
  String? _subcategory;
  String get subcategory => _subcategory ?? '';
  bool hasSubcategory() => _subcategory != null;

  // "information" field.
  String? _information;
  String get information => _information ?? '';
  bool hasInformation() => _information != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "views" field.
  int? _views;
  int get views => _views ?? 0;
  bool hasViews() => _views != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _subcategory = snapshotData['subcategory'] as String?;
    _information = snapshotData['information'] as String?;
    _link = snapshotData['link'] as String?;
    _views = castToType<int>(snapshotData['views']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('resourceprovider');

  static Stream<ResourceproviderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResourceproviderRecord.fromSnapshot(s));

  static Future<ResourceproviderRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ResourceproviderRecord.fromSnapshot(s));

  static ResourceproviderRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResourceproviderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResourceproviderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResourceproviderRecord._(reference, mapFromFirestore(data));

  static ResourceproviderRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ResourceproviderRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'subcategory': snapshot.data['subcategory'],
          'information': snapshot.data['information'],
          'link': snapshot.data['link'],
          'views': convertAlgoliaParam(
            snapshot.data['views'],
            ParamType.int,
            false,
          ),
        },
        ResourceproviderRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ResourceproviderRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'resourceprovider',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ResourceproviderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResourceproviderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResourceproviderRecordData({
  String? name,
  String? subcategory,
  String? information,
  String? link,
  int? views,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'subcategory': subcategory,
      'information': information,
      'link': link,
      'views': views,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResourceproviderRecordDocumentEquality
    implements Equality<ResourceproviderRecord> {
  const ResourceproviderRecordDocumentEquality();

  @override
  bool equals(ResourceproviderRecord? e1, ResourceproviderRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.subcategory == e2?.subcategory &&
        e1?.information == e2?.information &&
        e1?.link == e2?.link &&
        e1?.views == e2?.views;
  }

  @override
  int hash(ResourceproviderRecord? e) => const ListEquality()
      .hash([e?.name, e?.subcategory, e?.information, e?.link, e?.views]);

  @override
  bool isValidKey(Object? o) => o is ResourceproviderRecord;
}
