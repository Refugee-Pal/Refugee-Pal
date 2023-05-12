// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserRecord> _$userRecordSerializer = new _$UserRecordSerializer();

class _$UserRecordSerializer implements StructuredSerializer<UserRecord> {
  @override
  final Iterable<Type> types = const [UserRecord, _$UserRecord];
  @override
  final String wireName = 'UserRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.language;
    if (value != null) {
      result
        ..add('language')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.countryOfOrigin;
    if (value != null) {
      result
        ..add('country_of_origin')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.refugeeStatus;
    if (value != null) {
      result
        ..add('refugee_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.durationInCanada;
    if (value != null) {
      result
        ..add('duration_in_canada')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isRefugee;
    if (value != null) {
      result
        ..add('isRefugee')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.areasOfInterest;
    if (value != null) {
      result
        ..add('areasOfInterest')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.recents;
    if (value != null) {
      result
        ..add('recents')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.pinned;
    if (value != null) {
      result
        ..add('pinned')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.translateApp;
    if (value != null) {
      result
        ..add('translateApp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  UserRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'language':
          result.language = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'country_of_origin':
          result.countryOfOrigin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'refugee_status':
          result.refugeeStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'duration_in_canada':
          result.durationInCanada = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isRefugee':
          result.isRefugee = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'areasOfInterest':
          result.areasOfInterest.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'recents':
          result.recents.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'pinned':
          result.pinned.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'translateApp':
          result.translateApp = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$UserRecord extends UserRecord {
  @override
  final String? email;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? language;
  @override
  final String? countryOfOrigin;
  @override
  final String? refugeeStatus;
  @override
  final String? durationInCanada;
  @override
  final String? name;
  @override
  final String? displayName;
  @override
  final bool? isRefugee;
  @override
  final BuiltList<String>? areasOfInterest;
  @override
  final String? phoneNumber;
  @override
  final String? description;
  @override
  final BuiltList<String>? recents;
  @override
  final BuiltList<String>? pinned;
  @override
  final String? translateApp;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserRecord([void Function(UserRecordBuilder)? updates]) =>
      (new UserRecordBuilder()..update(updates))._build();

  _$UserRecord._(
      {this.email,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.language,
      this.countryOfOrigin,
      this.refugeeStatus,
      this.durationInCanada,
      this.name,
      this.displayName,
      this.isRefugee,
      this.areasOfInterest,
      this.phoneNumber,
      this.description,
      this.recents,
      this.pinned,
      this.translateApp,
      this.ffRef})
      : super._();

  @override
  UserRecord rebuild(void Function(UserRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserRecordBuilder toBuilder() => new UserRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserRecord &&
        email == other.email &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        language == other.language &&
        countryOfOrigin == other.countryOfOrigin &&
        refugeeStatus == other.refugeeStatus &&
        durationInCanada == other.durationInCanada &&
        name == other.name &&
        displayName == other.displayName &&
        isRefugee == other.isRefugee &&
        areasOfInterest == other.areasOfInterest &&
        phoneNumber == other.phoneNumber &&
        description == other.description &&
        recents == other.recents &&
        pinned == other.pinned &&
        translateApp == other.translateApp &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, language.hashCode);
    _$hash = $jc(_$hash, countryOfOrigin.hashCode);
    _$hash = $jc(_$hash, refugeeStatus.hashCode);
    _$hash = $jc(_$hash, durationInCanada.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, isRefugee.hashCode);
    _$hash = $jc(_$hash, areasOfInterest.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, recents.hashCode);
    _$hash = $jc(_$hash, pinned.hashCode);
    _$hash = $jc(_$hash, translateApp.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserRecord')
          ..add('email', email)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('language', language)
          ..add('countryOfOrigin', countryOfOrigin)
          ..add('refugeeStatus', refugeeStatus)
          ..add('durationInCanada', durationInCanada)
          ..add('name', name)
          ..add('displayName', displayName)
          ..add('isRefugee', isRefugee)
          ..add('areasOfInterest', areasOfInterest)
          ..add('phoneNumber', phoneNumber)
          ..add('description', description)
          ..add('recents', recents)
          ..add('pinned', pinned)
          ..add('translateApp', translateApp)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserRecordBuilder implements Builder<UserRecord, UserRecordBuilder> {
  _$UserRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _language;
  String? get language => _$this._language;
  set language(String? language) => _$this._language = language;

  String? _countryOfOrigin;
  String? get countryOfOrigin => _$this._countryOfOrigin;
  set countryOfOrigin(String? countryOfOrigin) =>
      _$this._countryOfOrigin = countryOfOrigin;

  String? _refugeeStatus;
  String? get refugeeStatus => _$this._refugeeStatus;
  set refugeeStatus(String? refugeeStatus) =>
      _$this._refugeeStatus = refugeeStatus;

  String? _durationInCanada;
  String? get durationInCanada => _$this._durationInCanada;
  set durationInCanada(String? durationInCanada) =>
      _$this._durationInCanada = durationInCanada;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  bool? _isRefugee;
  bool? get isRefugee => _$this._isRefugee;
  set isRefugee(bool? isRefugee) => _$this._isRefugee = isRefugee;

  ListBuilder<String>? _areasOfInterest;
  ListBuilder<String> get areasOfInterest =>
      _$this._areasOfInterest ??= new ListBuilder<String>();
  set areasOfInterest(ListBuilder<String>? areasOfInterest) =>
      _$this._areasOfInterest = areasOfInterest;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ListBuilder<String>? _recents;
  ListBuilder<String> get recents =>
      _$this._recents ??= new ListBuilder<String>();
  set recents(ListBuilder<String>? recents) => _$this._recents = recents;

  ListBuilder<String>? _pinned;
  ListBuilder<String> get pinned =>
      _$this._pinned ??= new ListBuilder<String>();
  set pinned(ListBuilder<String>? pinned) => _$this._pinned = pinned;

  String? _translateApp;
  String? get translateApp => _$this._translateApp;
  set translateApp(String? translateApp) => _$this._translateApp = translateApp;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserRecordBuilder() {
    UserRecord._initializeBuilder(this);
  }

  UserRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _language = $v.language;
      _countryOfOrigin = $v.countryOfOrigin;
      _refugeeStatus = $v.refugeeStatus;
      _durationInCanada = $v.durationInCanada;
      _name = $v.name;
      _displayName = $v.displayName;
      _isRefugee = $v.isRefugee;
      _areasOfInterest = $v.areasOfInterest?.toBuilder();
      _phoneNumber = $v.phoneNumber;
      _description = $v.description;
      _recents = $v.recents?.toBuilder();
      _pinned = $v.pinned?.toBuilder();
      _translateApp = $v.translateApp;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserRecord;
  }

  @override
  void update(void Function(UserRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserRecord build() => _build();

  _$UserRecord _build() {
    _$UserRecord _$result;
    try {
      _$result = _$v ??
          new _$UserRecord._(
              email: email,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              language: language,
              countryOfOrigin: countryOfOrigin,
              refugeeStatus: refugeeStatus,
              durationInCanada: durationInCanada,
              name: name,
              displayName: displayName,
              isRefugee: isRefugee,
              areasOfInterest: _areasOfInterest?.build(),
              phoneNumber: phoneNumber,
              description: description,
              recents: _recents?.build(),
              pinned: _pinned?.build(),
              translateApp: translateApp,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'areasOfInterest';
        _areasOfInterest?.build();

        _$failedField = 'recents';
        _recents?.build();
        _$failedField = 'pinned';
        _pinned?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
