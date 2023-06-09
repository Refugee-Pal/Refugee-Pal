import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_record.g.dart';

abstract class UserRecord implements Built<UserRecord, UserRecordBuilder> {
  static Serializer<UserRecord> get serializer => _$userRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  String? get language;

  @BuiltValueField(wireName: 'country_of_origin')
  String? get countryOfOrigin;

  @BuiltValueField(wireName: 'refugee_status')
  String? get refugeeStatus;

  @BuiltValueField(wireName: 'duration_in_canada')
  String? get durationInCanada;

  String? get name;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  BuiltList<String>? get areasOfInterest;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  String? get description;

  BuiltList<String>? get recents;

  BuiltList<String>? get pinned;

  String? get translateApp;

  String? get isRefugee;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserRecordBuilder builder) => builder
    ..email = ''
    ..photoUrl = ''
    ..uid = ''
    ..language = ''
    ..countryOfOrigin = ''
    ..refugeeStatus = ''
    ..durationInCanada = ''
    ..name = ''
    ..displayName = ''
    ..areasOfInterest = ListBuilder()
    ..phoneNumber = ''
    ..description = ''
    ..recents = ListBuilder()
    ..pinned = ListBuilder()
    ..translateApp = ''
    ..isRefugee = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static UserRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => UserRecord(
        (c) => c
          ..email = snapshot.data['email']
          ..photoUrl = snapshot.data['photo_url']
          ..uid = snapshot.data['uid']
          ..createdTime = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['created_time']))
          ..language = snapshot.data['language']
          ..countryOfOrigin = snapshot.data['country_of_origin']
          ..refugeeStatus = snapshot.data['refugee_status']
          ..durationInCanada = snapshot.data['duration_in_canada']
          ..name = snapshot.data['name']
          ..displayName = snapshot.data['display_name']
          ..areasOfInterest =
              safeGet(() => ListBuilder(snapshot.data['areasOfInterest']))
          ..phoneNumber = snapshot.data['phone_number']
          ..description = snapshot.data['description']
          ..recents = safeGet(() => ListBuilder(snapshot.data['recents']))
          ..pinned = safeGet(() => ListBuilder(snapshot.data['pinned']))
          ..translateApp = snapshot.data['translateApp']
          ..isRefugee = snapshot.data['isRefugee']
          ..ffRef = UserRecord.collection.doc(snapshot.objectID),
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

  UserRecord._();
  factory UserRecord([void Function(UserRecordBuilder) updates]) = _$UserRecord;

  static UserRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? language,
  String? countryOfOrigin,
  String? refugeeStatus,
  String? durationInCanada,
  String? name,
  String? displayName,
  String? phoneNumber,
  String? description,
  String? translateApp,
  String? isRefugee,
}) {
  final firestoreData = serializers.toFirestore(
    UserRecord.serializer,
    UserRecord(
      (u) => u
        ..email = email
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..language = language
        ..countryOfOrigin = countryOfOrigin
        ..refugeeStatus = refugeeStatus
        ..durationInCanada = durationInCanada
        ..name = name
        ..displayName = displayName
        ..areasOfInterest = null
        ..phoneNumber = phoneNumber
        ..description = description
        ..recents = null
        ..pinned = null
        ..translateApp = translateApp
        ..isRefugee = isRefugee,
    ),
  );

  return firestoreData;
}
