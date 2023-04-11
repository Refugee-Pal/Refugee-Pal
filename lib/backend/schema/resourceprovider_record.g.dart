// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resourceprovider_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ResourceproviderRecord> _$resourceproviderRecordSerializer =
    new _$ResourceproviderRecordSerializer();

class _$ResourceproviderRecordSerializer
    implements StructuredSerializer<ResourceproviderRecord> {
  @override
  final Iterable<Type> types = const [
    ResourceproviderRecord,
    _$ResourceproviderRecord
  ];
  @override
  final String wireName = 'ResourceproviderRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ResourceproviderRecord object,
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
    value = object.subcategory;
    if (value != null) {
      result
        ..add('subcategory')
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
    value = object.link;
    if (value != null) {
      result
        ..add('link')
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
  ResourceproviderRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResourceproviderRecordBuilder();

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
        case 'subcategory':
          result.subcategory = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'information':
          result.information = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
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

class _$ResourceproviderRecord extends ResourceproviderRecord {
  @override
  final String? name;
  @override
  final String? subcategory;
  @override
  final String? information;
  @override
  final String? link;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ResourceproviderRecord(
          [void Function(ResourceproviderRecordBuilder)? updates]) =>
      (new ResourceproviderRecordBuilder()..update(updates))._build();

  _$ResourceproviderRecord._(
      {this.name, this.subcategory, this.information, this.link, this.ffRef})
      : super._();

  @override
  ResourceproviderRecord rebuild(
          void Function(ResourceproviderRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResourceproviderRecordBuilder toBuilder() =>
      new ResourceproviderRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResourceproviderRecord &&
        name == other.name &&
        subcategory == other.subcategory &&
        information == other.information &&
        link == other.link &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, subcategory.hashCode);
    _$hash = $jc(_$hash, information.hashCode);
    _$hash = $jc(_$hash, link.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResourceproviderRecord')
          ..add('name', name)
          ..add('subcategory', subcategory)
          ..add('information', information)
          ..add('link', link)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ResourceproviderRecordBuilder
    implements Builder<ResourceproviderRecord, ResourceproviderRecordBuilder> {
  _$ResourceproviderRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _subcategory;
  String? get subcategory => _$this._subcategory;
  set subcategory(String? subcategory) => _$this._subcategory = subcategory;

  String? _information;
  String? get information => _$this._information;
  set information(String? information) => _$this._information = information;

  String? _link;
  String? get link => _$this._link;
  set link(String? link) => _$this._link = link;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ResourceproviderRecordBuilder() {
    ResourceproviderRecord._initializeBuilder(this);
  }

  ResourceproviderRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _subcategory = $v.subcategory;
      _information = $v.information;
      _link = $v.link;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResourceproviderRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResourceproviderRecord;
  }

  @override
  void update(void Function(ResourceproviderRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResourceproviderRecord build() => _build();

  _$ResourceproviderRecord _build() {
    final _$result = _$v ??
        new _$ResourceproviderRecord._(
            name: name,
            subcategory: subcategory,
            information: information,
            link: link,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
