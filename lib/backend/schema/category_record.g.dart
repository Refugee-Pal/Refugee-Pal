// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CategoryRecord> _$categoryRecordSerializer =
    new _$CategoryRecordSerializer();

class _$CategoryRecordSerializer
    implements StructuredSerializer<CategoryRecord> {
  @override
  final Iterable<Type> types = const [CategoryRecord, _$CategoryRecord];
  @override
  final String wireName = 'CategoryRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CategoryRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
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
    value = object.banner;
    if (value != null) {
      result
        ..add('banner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isinmap;
    if (value != null) {
      result
        ..add('isinmap')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.icon;
    if (value != null) {
      result
        ..add('icon')
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
  CategoryRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoryRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'banner':
          result.banner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isinmap':
          result.isinmap = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value,
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

class _$CategoryRecord extends CategoryRecord {
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? banner;
  @override
  final bool? isinmap;
  @override
  final String? icon;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CategoryRecord([void Function(CategoryRecordBuilder)? updates]) =>
      (new CategoryRecordBuilder()..update(updates))._build();

  _$CategoryRecord._(
      {this.title,
      this.description,
      this.banner,
      this.isinmap,
      this.icon,
      this.ffRef})
      : super._();

  @override
  CategoryRecord rebuild(void Function(CategoryRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryRecordBuilder toBuilder() =>
      new CategoryRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoryRecord &&
        title == other.title &&
        description == other.description &&
        banner == other.banner &&
        isinmap == other.isinmap &&
        icon == other.icon &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, banner.hashCode);
    _$hash = $jc(_$hash, isinmap.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CategoryRecord')
          ..add('title', title)
          ..add('description', description)
          ..add('banner', banner)
          ..add('isinmap', isinmap)
          ..add('icon', icon)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CategoryRecordBuilder
    implements Builder<CategoryRecord, CategoryRecordBuilder> {
  _$CategoryRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _banner;
  String? get banner => _$this._banner;
  set banner(String? banner) => _$this._banner = banner;

  bool? _isinmap;
  bool? get isinmap => _$this._isinmap;
  set isinmap(bool? isinmap) => _$this._isinmap = isinmap;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CategoryRecordBuilder() {
    CategoryRecord._initializeBuilder(this);
  }

  CategoryRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _banner = $v.banner;
      _isinmap = $v.isinmap;
      _icon = $v.icon;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoryRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CategoryRecord;
  }

  @override
  void update(void Function(CategoryRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CategoryRecord build() => _build();

  _$CategoryRecord _build() {
    final _$result = _$v ??
        new _$CategoryRecord._(
            title: title,
            description: description,
            banner: banner,
            isinmap: isinmap,
            icon: icon,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
