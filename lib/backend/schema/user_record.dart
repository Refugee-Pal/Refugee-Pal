import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  // "refugee_status" field.
  String? _refugeeStatus;
  String get refugeeStatus => _refugeeStatus ?? '';
  bool hasRefugeeStatus() => _refugeeStatus != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "areasOfInterest" field.
  List<String>? _areasOfInterest;
  List<String> get areasOfInterest => _areasOfInterest ?? const [];
  bool hasAreasOfInterest() => _areasOfInterest != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "recents" field.
  List<String>? _recents;
  List<String> get recents => _recents ?? const [];
  bool hasRecents() => _recents != null;

  // "pinned" field.
  List<String>? _pinned;
  List<String> get pinned => _pinned ?? const [];
  bool hasPinned() => _pinned != null;

  // "translateApp" field.
  String? _translateApp;
  String get translateApp => _translateApp ?? '';
  bool hasTranslateApp() => _translateApp != null;

  // "isRefugee" field.
  String? _isRefugee;
  String get isRefugee => _isRefugee ?? '';
  bool hasIsRefugee() => _isRefugee != null;

  // "dateArrived" field.
  DateTime? _dateArrived;
  DateTime? get dateArrived => _dateArrived;
  bool hasDateArrived() => _dateArrived != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  void _initializeFields() {
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _language = snapshotData['language'] as String?;
    _refugeeStatus = snapshotData['refugee_status'] as String?;
    _name = snapshotData['name'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _areasOfInterest = getDataList(snapshotData['areasOfInterest']);
    _phoneNumber = snapshotData['phone_number'] as String?;
    _description = snapshotData['description'] as String?;
    _recents = getDataList(snapshotData['recents']);
    _pinned = getDataList(snapshotData['pinned']);
    _translateApp = snapshotData['translateApp'] as String?;
    _isRefugee = snapshotData['isRefugee'] as String?;
    _dateArrived = snapshotData['dateArrived'] as DateTime?;
    _email = snapshotData['email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  static UserRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UserRecord.getDocumentFromData(
        {
          'photo_url': snapshot.data['photo_url'],
          'uid': snapshot.data['uid'],
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'language': snapshot.data['language'],
          'refugee_status': snapshot.data['refugee_status'],
          'name': snapshot.data['name'],
          'display_name': snapshot.data['display_name'],
          'areasOfInterest': safeGet(
            () => snapshot.data['areasOfInterest'].toList(),
          ),
          'phone_number': snapshot.data['phone_number'],
          'description': snapshot.data['description'],
          'recents': safeGet(
            () => snapshot.data['recents'].toList(),
          ),
          'pinned': safeGet(
            () => snapshot.data['pinned'].toList(),
          ),
          'translateApp': snapshot.data['translateApp'],
          'isRefugee': snapshot.data['isRefugee'],
          'dateArrived': convertAlgoliaParam(
            snapshot.data['dateArrived'],
            ParamType.DateTime,
            false,
          ),
          'email': snapshot.data['email'],
        },
        UserRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UserRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'user',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? language,
  String? refugeeStatus,
  String? name,
  String? displayName,
  String? phoneNumber,
  String? description,
  String? translateApp,
  String? isRefugee,
  DateTime? dateArrived,
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'language': language,
      'refugee_status': refugeeStatus,
      'name': name,
      'display_name': displayName,
      'phone_number': phoneNumber,
      'description': description,
      'translateApp': translateApp,
      'isRefugee': isRefugee,
      'dateArrived': dateArrived,
      'email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    const listEquality = ListEquality();
    return e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.language == e2?.language &&
        e1?.refugeeStatus == e2?.refugeeStatus &&
        e1?.name == e2?.name &&
        e1?.displayName == e2?.displayName &&
        listEquality.equals(e1?.areasOfInterest, e2?.areasOfInterest) &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.recents, e2?.recents) &&
        listEquality.equals(e1?.pinned, e2?.pinned) &&
        e1?.translateApp == e2?.translateApp &&
        e1?.isRefugee == e2?.isRefugee &&
        e1?.dateArrived == e2?.dateArrived &&
        e1?.email == e2?.email;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.language,
        e?.refugeeStatus,
        e?.name,
        e?.displayName,
        e?.areasOfInterest,
        e?.phoneNumber,
        e?.description,
        e?.recents,
        e?.pinned,
        e?.translateApp,
        e?.isRefugee,
        e?.dateArrived,
        e?.email
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
