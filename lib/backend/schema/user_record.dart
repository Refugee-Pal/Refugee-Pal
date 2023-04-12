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

  bool? get isRefugee;

  bool? get translateApp;

  BuiltList<String>? get areasOfInterest;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  String? get description;

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
    ..isRefugee = false
    ..translateApp = false
    ..areasOfInterest = ListBuilder()
    ..phoneNumber = ''
    ..description = '';

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
          ..isRefugee = snapshot.data['isRefugee']
          ..translateApp = snapshot.data['translateApp']
          ..areasOfInterest =
              safeGet(() => ListBuilder(snapshot.data['areasOfInterest']))
          ..phoneNumber = snapshot.data['phone_number']
          ..description = snapshot.data['description']
          ..ffRef = UserRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UserRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'user',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
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
  bool? isRefugee,
  bool? translateApp,
  String? phoneNumber,
  String? description,
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
        ..isRefugee = isRefugee
        ..translateApp = translateApp
        ..areasOfInterest = null
        ..phoneNumber = phoneNumber
        ..description = description,
    ),
  );

  return firestoreData;
}
