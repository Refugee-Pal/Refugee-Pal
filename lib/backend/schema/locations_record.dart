import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationsRecord extends FirestoreRecord {
  LocationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  bool hasWebsite() => _website != null;

  // "directions" field.
  String? _directions;
  String get directions => _directions ?? '';
  bool hasDirections() => _directions != null;

  // "mail" field.
  String? _mail;
  String get mail => _mail ?? '';
  bool hasMail() => _mail != null;

  // "phone" field.
  int? _phone;
  int get phone => _phone ?? 0;
  bool hasPhone() => _phone != null;

  // "coordinates" field.
  LatLng? _coordinates;
  LatLng? get coordinates => _coordinates;
  bool hasCoordinates() => _coordinates != null;

  // "bullet" field.
  List<String>? _bullet;
  List<String> get bullet => _bullet ?? const [];
  bool hasBullet() => _bullet != null;

  // "category" field.
  List<String>? _category;
  List<String> get category => _category ?? const [];
  bool hasCategory() => _category != null;

  // "imgPath" field.
  String? _imgPath;
  String get imgPath => _imgPath ?? '';
  bool hasImgPath() => _imgPath != null;

  // "organization" field.
  String? _organization;
  String get organization => _organization ?? '';
  bool hasOrganization() => _organization != null;

  // "people" field.
  List<String>? _people;
  List<String> get people => _people ?? const [];
  bool hasPeople() => _people != null;

  // "views" field.
  int? _views;
  int get views => _views ?? 0;
  bool hasViews() => _views != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _address = snapshotData['address'] as String?;
    _type = snapshotData['type'] as String?;
    _description = snapshotData['description'] as String?;
    _website = snapshotData['website'] as String?;
    _directions = snapshotData['directions'] as String?;
    _mail = snapshotData['mail'] as String?;
    _phone = castToType<int>(snapshotData['phone']);
    _coordinates = snapshotData['coordinates'] as LatLng?;
    _bullet = getDataList(snapshotData['bullet']);
    _category = getDataList(snapshotData['category']);
    _imgPath = snapshotData['imgPath'] as String?;
    _organization = snapshotData['organization'] as String?;
    _people = getDataList(snapshotData['people']);
    _views = castToType<int>(snapshotData['views']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('locations');

  static Stream<LocationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LocationsRecord.fromSnapshot(s));

  static Future<LocationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LocationsRecord.fromSnapshot(s));

  static LocationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LocationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LocationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LocationsRecord._(reference, mapFromFirestore(data));

  static LocationsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      LocationsRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'address': snapshot.data['address'],
          'type': snapshot.data['type'],
          'description': snapshot.data['description'],
          'website': snapshot.data['website'],
          'directions': snapshot.data['directions'],
          'mail': snapshot.data['mail'],
          'phone': convertAlgoliaParam(
            snapshot.data['phone'],
            ParamType.int,
            false,
          ),
          'coordinates': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'bullet': safeGet(
            () => snapshot.data['bullet'].toList(),
          ),
          'category': safeGet(
            () => snapshot.data['category'].toList(),
          ),
          'imgPath': snapshot.data['imgPath'],
          'organization': snapshot.data['organization'],
          'people': safeGet(
            () => snapshot.data['people'].toList(),
          ),
          'views': convertAlgoliaParam(
            snapshot.data['views'],
            ParamType.int,
            false,
          ),
        },
        LocationsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<LocationsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'locations',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'LocationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LocationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLocationsRecordData({
  String? name,
  String? address,
  String? type,
  String? description,
  String? website,
  String? directions,
  String? mail,
  int? phone,
  LatLng? coordinates,
  String? imgPath,
  String? organization,
  int? views,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'address': address,
      'type': type,
      'description': description,
      'website': website,
      'directions': directions,
      'mail': mail,
      'phone': phone,
      'coordinates': coordinates,
      'imgPath': imgPath,
      'organization': organization,
      'views': views,
    }.withoutNulls,
  );

  return firestoreData;
}

class LocationsRecordDocumentEquality implements Equality<LocationsRecord> {
  const LocationsRecordDocumentEquality();

  @override
  bool equals(LocationsRecord? e1, LocationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.address == e2?.address &&
        e1?.type == e2?.type &&
        e1?.description == e2?.description &&
        e1?.website == e2?.website &&
        e1?.directions == e2?.directions &&
        e1?.mail == e2?.mail &&
        e1?.phone == e2?.phone &&
        e1?.coordinates == e2?.coordinates &&
        listEquality.equals(e1?.bullet, e2?.bullet) &&
        listEquality.equals(e1?.category, e2?.category) &&
        e1?.imgPath == e2?.imgPath &&
        e1?.organization == e2?.organization &&
        listEquality.equals(e1?.people, e2?.people) &&
        e1?.views == e2?.views;
  }

  @override
  int hash(LocationsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.address,
        e?.type,
        e?.description,
        e?.website,
        e?.directions,
        e?.mail,
        e?.phone,
        e?.coordinates,
        e?.bullet,
        e?.category,
        e?.imgPath,
        e?.organization,
        e?.people,
        e?.views
      ]);

  @override
  bool isValidKey(Object? o) => o is LocationsRecord;
}
