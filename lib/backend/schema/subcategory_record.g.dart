// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SubcategoryRecord> _$subcategoryRecordSerializer =
    new _$SubcategoryRecordSerializer();

class _$SubcategoryRecordSerializer
    implements StructuredSerializer<SubcategoryRecord> {
  @override
  final Iterable<Type> types = const [SubcategoryRecord, _$SubcategoryRecord];
  @override
  final String wireName = 'SubcategoryRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, SubcategoryRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.information;
    if (value != null) {
      result
        ..add('information')
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
  SubcategoryRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubcategoryRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'information':
          result.information = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
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

class _$SubcategoryRecord extends SubcategoryRecord {
  @override
  final String? category;
  @override
  final String? information;
  @override
  final String? name;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SubcategoryRecord(
          [void Function(SubcategoryRecordBuilder)? updates]) =>
      (new SubcategoryRecordBuilder()..update(updates))._build();

  _$SubcategoryRecord._(
      {this.category, this.information, this.name, this.ffRef})
      : super._();

  @override
  SubcategoryRecord rebuild(void Function(SubcategoryRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubcategoryRecordBuilder toBuilder() =>
      new SubcategoryRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubcategoryRecord &&
        category == other.category &&
        information == other.information &&
        name == other.name &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, information.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubcategoryRecord')
          ..add('category', category)
          ..add('information', information)
          ..add('name', name)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SubcategoryRecordBuilder
    implements Builder<SubcategoryRecord, SubcategoryRecordBuilder> {
  _$SubcategoryRecord? _$v;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  String? _information;
  String? get information => _$this._information;
  set information(String? information) => _$this._information = information;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SubcategoryRecordBuilder() {
    SubcategoryRecord._initializeBuilder(this);
  }

  SubcategoryRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _category = $v.category;
      _information = $v.information;
      _name = $v.name;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubcategoryRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubcategoryRecord;
  }

  @override
  void update(void Function(SubcategoryRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubcategoryRecord build() => _build();

  _$SubcategoryRecord _build() {
    final _$result = _$v ??
        new _$SubcategoryRecord._(
            category: category,
            information: information,
            name: name,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
