// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professionals_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProfessionalsRecord> _$professionalsRecordSerializer =
    new _$ProfessionalsRecordSerializer();

class _$ProfessionalsRecordSerializer
    implements StructuredSerializer<ProfessionalsRecord> {
  @override
  final Iterable<Type> types = const [
    ProfessionalsRecord,
    _$ProfessionalsRecord
  ];
  @override
  final String wireName = 'ProfessionalsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ProfessionalsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.language;
    if (value != null) {
      result
        ..add('language')
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
    value = object.profession;
    if (value != null) {
      result
        ..add('profession')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.registrationstatus;
    if (value != null) {
      result
        ..add('registrationstatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mail;
    if (value != null) {
      result
        ..add('mail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.website;
    if (value != null) {
      result
        ..add('website')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.contact;
    if (value != null) {
      result
        ..add('contact')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.practicename;
    if (value != null) {
      result
        ..add('practicename')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isIFHP;
    if (value != null) {
      result
        ..add('isIFHP')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isFree;
    if (value != null) {
      result
        ..add('isFree')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.profile;
    if (value != null) {
      result
        ..add('profile')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.views;
    if (value != null) {
      result
        ..add('views')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  ProfessionalsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProfessionalsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'language':
          result.language = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'profession':
          result.profession = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'registrationstatus':
          result.registrationstatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mail':
          result.mail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'website':
          result.website = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'contact':
          result.contact = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'practicename':
          result.practicename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isIFHP':
          result.isIFHP = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isFree':
          result.isFree = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'profile':
          result.profile = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'views':
          result.views = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$ProfessionalsRecord extends ProfessionalsRecord {
  @override
  final String? address;
  @override
  final String? language;
  @override
  final String? name;
  @override
  final String? profession;
  @override
  final String? registrationstatus;
  @override
  final String? mail;
  @override
  final String? website;
  @override
  final int? contact;
  @override
  final String? practicename;
  @override
  final bool? isIFHP;
  @override
  final bool? isFree;
  @override
  final String? profile;
  @override
  final int? views;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ProfessionalsRecord(
          [void Function(ProfessionalsRecordBuilder)? updates]) =>
      (new ProfessionalsRecordBuilder()..update(updates))._build();

  _$ProfessionalsRecord._(
      {this.address,
      this.language,
      this.name,
      this.profession,
      this.registrationstatus,
      this.mail,
      this.website,
      this.contact,
      this.practicename,
      this.isIFHP,
      this.isFree,
      this.profile,
      this.views,
      this.ffRef})
      : super._();

  @override
  ProfessionalsRecord rebuild(
          void Function(ProfessionalsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfessionalsRecordBuilder toBuilder() =>
      new ProfessionalsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfessionalsRecord &&
        address == other.address &&
        language == other.language &&
        name == other.name &&
        profession == other.profession &&
        registrationstatus == other.registrationstatus &&
        mail == other.mail &&
        website == other.website &&
        contact == other.contact &&
        practicename == other.practicename &&
        isIFHP == other.isIFHP &&
        isFree == other.isFree &&
        profile == other.profile &&
        views == other.views &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, language.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, profession.hashCode);
    _$hash = $jc(_$hash, registrationstatus.hashCode);
    _$hash = $jc(_$hash, mail.hashCode);
    _$hash = $jc(_$hash, website.hashCode);
    _$hash = $jc(_$hash, contact.hashCode);
    _$hash = $jc(_$hash, practicename.hashCode);
    _$hash = $jc(_$hash, isIFHP.hashCode);
    _$hash = $jc(_$hash, isFree.hashCode);
    _$hash = $jc(_$hash, profile.hashCode);
    _$hash = $jc(_$hash, views.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProfessionalsRecord')
          ..add('address', address)
          ..add('language', language)
          ..add('name', name)
          ..add('profession', profession)
          ..add('registrationstatus', registrationstatus)
          ..add('mail', mail)
          ..add('website', website)
          ..add('contact', contact)
          ..add('practicename', practicename)
          ..add('isIFHP', isIFHP)
          ..add('isFree', isFree)
          ..add('profile', profile)
          ..add('views', views)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ProfessionalsRecordBuilder
    implements Builder<ProfessionalsRecord, ProfessionalsRecordBuilder> {
  _$ProfessionalsRecord? _$v;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _language;
  String? get language => _$this._language;
  set language(String? language) => _$this._language = language;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _profession;
  String? get profession => _$this._profession;
  set profession(String? profession) => _$this._profession = profession;

  String? _registrationstatus;
  String? get registrationstatus => _$this._registrationstatus;
  set registrationstatus(String? registrationstatus) =>
      _$this._registrationstatus = registrationstatus;

  String? _mail;
  String? get mail => _$this._mail;
  set mail(String? mail) => _$this._mail = mail;

  String? _website;
  String? get website => _$this._website;
  set website(String? website) => _$this._website = website;

  int? _contact;
  int? get contact => _$this._contact;
  set contact(int? contact) => _$this._contact = contact;

  String? _practicename;
  String? get practicename => _$this._practicename;
  set practicename(String? practicename) => _$this._practicename = practicename;

  bool? _isIFHP;
  bool? get isIFHP => _$this._isIFHP;
  set isIFHP(bool? isIFHP) => _$this._isIFHP = isIFHP;

  bool? _isFree;
  bool? get isFree => _$this._isFree;
  set isFree(bool? isFree) => _$this._isFree = isFree;

  String? _profile;
  String? get profile => _$this._profile;
  set profile(String? profile) => _$this._profile = profile;

  int? _views;
  int? get views => _$this._views;
  set views(int? views) => _$this._views = views;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ProfessionalsRecordBuilder() {
    ProfessionalsRecord._initializeBuilder(this);
  }

  ProfessionalsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _address = $v.address;
      _language = $v.language;
      _name = $v.name;
      _profession = $v.profession;
      _registrationstatus = $v.registrationstatus;
      _mail = $v.mail;
      _website = $v.website;
      _contact = $v.contact;
      _practicename = $v.practicename;
      _isIFHP = $v.isIFHP;
      _isFree = $v.isFree;
      _profile = $v.profile;
      _views = $v.views;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfessionalsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProfessionalsRecord;
  }

  @override
  void update(void Function(ProfessionalsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProfessionalsRecord build() => _build();

  _$ProfessionalsRecord _build() {
    final _$result = _$v ??
        new _$ProfessionalsRecord._(
            address: address,
            language: language,
            name: name,
            profession: profession,
            registrationstatus: registrationstatus,
            mail: mail,
            website: website,
            contact: contact,
            practicename: practicename,
            isIFHP: isIFHP,
            isFree: isFree,
            profile: profile,
            views: views,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
