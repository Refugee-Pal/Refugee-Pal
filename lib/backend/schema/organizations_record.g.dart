// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizations_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrganizationsRecord> _$organizationsRecordSerializer =
    new _$OrganizationsRecordSerializer();

class _$OrganizationsRecordSerializer
    implements StructuredSerializer<OrganizationsRecord> {
  @override
  final Iterable<Type> types = const [
    OrganizationsRecord,
    _$OrganizationsRecord
  ];
  @override
  final String wireName = 'OrganizationsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, OrganizationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.people;
    if (value != null) {
      result
        ..add('people')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.logoPath;
    if (value != null) {
      result
        ..add('logoPath')
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
  OrganizationsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrganizationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'people':
          result.people.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'logoPath':
          result.logoPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
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

class _$OrganizationsRecord extends OrganizationsRecord {
  @override
  final String? name;
  @override
  final BuiltList<String>? people;
  @override
  final String? logoPath;
  @override
  final String? description;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OrganizationsRecord(
          [void Function(OrganizationsRecordBuilder)? updates]) =>
      (new OrganizationsRecordBuilder()..update(updates))._build();

  _$OrganizationsRecord._(
      {this.name, this.people, this.logoPath, this.description, this.ffRef})
      : super._();

  @override
  OrganizationsRecord rebuild(
          void Function(OrganizationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganizationsRecordBuilder toBuilder() =>
      new OrganizationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrganizationsRecord &&
        name == other.name &&
        people == other.people &&
        logoPath == other.logoPath &&
        description == other.description &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, people.hashCode);
    _$hash = $jc(_$hash, logoPath.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrganizationsRecord')
          ..add('name', name)
          ..add('people', people)
          ..add('logoPath', logoPath)
          ..add('description', description)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OrganizationsRecordBuilder
    implements Builder<OrganizationsRecord, OrganizationsRecordBuilder> {
  _$OrganizationsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<String>? _people;
  ListBuilder<String> get people =>
      _$this._people ??= new ListBuilder<String>();
  set people(ListBuilder<String>? people) => _$this._people = people;

  String? _logoPath;
  String? get logoPath => _$this._logoPath;
  set logoPath(String? logoPath) => _$this._logoPath = logoPath;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OrganizationsRecordBuilder() {
    OrganizationsRecord._initializeBuilder(this);
  }

  OrganizationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _people = $v.people?.toBuilder();
      _logoPath = $v.logoPath;
      _description = $v.description;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrganizationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrganizationsRecord;
  }

  @override
  void update(void Function(OrganizationsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrganizationsRecord build() => _build();

  _$OrganizationsRecord _build() {
    _$OrganizationsRecord _$result;
    try {
      _$result = _$v ??
          new _$OrganizationsRecord._(
              name: name,
              people: _people?.build(),
              logoPath: logoPath,
              description: description,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'people';
        _people?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OrganizationsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
