// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'programs_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProgramsRecord> _$programsRecordSerializer =
    new _$ProgramsRecordSerializer();

class _$ProgramsRecordSerializer
    implements StructuredSerializer<ProgramsRecord> {
  @override
  final Iterable<Type> types = const [ProgramsRecord, _$ProgramsRecord];
  @override
  final String wireName = 'ProgramsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProgramsRecord object,
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
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
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
    value = object.dates;
    if (value != null) {
      result
        ..add('dates')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(DateTime)])));
    }
    value = object.website;
    if (value != null) {
      result
        ..add('website')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imgPath;
    if (value != null) {
      result
        ..add('imgPath')
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
  ProgramsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProgramsRecordBuilder();

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
        case 'category':
          result.category.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dates':
          result.dates.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DateTime)]))!
              as BuiltList<Object?>);
          break;
        case 'website':
          result.website = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'imgPath':
          result.imgPath = serializers.deserialize(value,
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

class _$ProgramsRecord extends ProgramsRecord {
  @override
  final String? name;
  @override
  final BuiltList<String>? people;
  @override
  final BuiltList<String>? category;
  @override
  final String? type;
  @override
  final String? description;
  @override
  final BuiltList<DateTime>? dates;
  @override
  final String? website;
  @override
  final String? imgPath;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ProgramsRecord([void Function(ProgramsRecordBuilder)? updates]) =>
      (new ProgramsRecordBuilder()..update(updates))._build();

  _$ProgramsRecord._(
      {this.name,
      this.people,
      this.category,
      this.type,
      this.description,
      this.dates,
      this.website,
      this.imgPath,
      this.ffRef})
      : super._();

  @override
  ProgramsRecord rebuild(void Function(ProgramsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProgramsRecordBuilder toBuilder() =>
      new ProgramsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProgramsRecord &&
        name == other.name &&
        people == other.people &&
        category == other.category &&
        type == other.type &&
        description == other.description &&
        dates == other.dates &&
        website == other.website &&
        imgPath == other.imgPath &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, people.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, dates.hashCode);
    _$hash = $jc(_$hash, website.hashCode);
    _$hash = $jc(_$hash, imgPath.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProgramsRecord')
          ..add('name', name)
          ..add('people', people)
          ..add('category', category)
          ..add('type', type)
          ..add('description', description)
          ..add('dates', dates)
          ..add('website', website)
          ..add('imgPath', imgPath)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ProgramsRecordBuilder
    implements Builder<ProgramsRecord, ProgramsRecordBuilder> {
  _$ProgramsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<String>? _people;
  ListBuilder<String> get people =>
      _$this._people ??= new ListBuilder<String>();
  set people(ListBuilder<String>? people) => _$this._people = people;

  ListBuilder<String>? _category;
  ListBuilder<String> get category =>
      _$this._category ??= new ListBuilder<String>();
  set category(ListBuilder<String>? category) => _$this._category = category;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ListBuilder<DateTime>? _dates;
  ListBuilder<DateTime> get dates =>
      _$this._dates ??= new ListBuilder<DateTime>();
  set dates(ListBuilder<DateTime>? dates) => _$this._dates = dates;

  String? _website;
  String? get website => _$this._website;
  set website(String? website) => _$this._website = website;

  String? _imgPath;
  String? get imgPath => _$this._imgPath;
  set imgPath(String? imgPath) => _$this._imgPath = imgPath;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ProgramsRecordBuilder() {
    ProgramsRecord._initializeBuilder(this);
  }

  ProgramsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _people = $v.people?.toBuilder();
      _category = $v.category?.toBuilder();
      _type = $v.type;
      _description = $v.description;
      _dates = $v.dates?.toBuilder();
      _website = $v.website;
      _imgPath = $v.imgPath;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProgramsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProgramsRecord;
  }

  @override
  void update(void Function(ProgramsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProgramsRecord build() => _build();

  _$ProgramsRecord _build() {
    _$ProgramsRecord _$result;
    try {
      _$result = _$v ??
          new _$ProgramsRecord._(
              name: name,
              people: _people?.build(),
              category: _category?.build(),
              type: type,
              description: description,
              dates: _dates?.build(),
              website: website,
              imgPath: imgPath,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'people';
        _people?.build();
        _$failedField = 'category';
        _category?.build();

        _$failedField = 'dates';
        _dates?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProgramsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
