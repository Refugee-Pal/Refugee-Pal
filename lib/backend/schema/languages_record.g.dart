// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'languages_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LanguagesRecord> _$languagesRecordSerializer =
    new _$LanguagesRecordSerializer();

class _$LanguagesRecordSerializer
    implements StructuredSerializer<LanguagesRecord> {
  @override
  final Iterable<Type> types = const [LanguagesRecord, _$LanguagesRecord];
  @override
  final String wireName = 'LanguagesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, LanguagesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('Name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.code;
    if (value != null) {
      result
        ..add('code')
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
  LanguagesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LanguagesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
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

class _$LanguagesRecord extends LanguagesRecord {
  @override
  final String? name;
  @override
  final String? code;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$LanguagesRecord([void Function(LanguagesRecordBuilder)? updates]) =>
      (new LanguagesRecordBuilder()..update(updates))._build();

  _$LanguagesRecord._({this.name, this.code, this.ffRef}) : super._();

  @override
  LanguagesRecord rebuild(void Function(LanguagesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LanguagesRecordBuilder toBuilder() =>
      new LanguagesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LanguagesRecord &&
        name == other.name &&
        code == other.code &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LanguagesRecord')
          ..add('name', name)
          ..add('code', code)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class LanguagesRecordBuilder
    implements Builder<LanguagesRecord, LanguagesRecordBuilder> {
  _$LanguagesRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  LanguagesRecordBuilder() {
    LanguagesRecord._initializeBuilder(this);
  }

  LanguagesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _code = $v.code;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LanguagesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LanguagesRecord;
  }

  @override
  void update(void Function(LanguagesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LanguagesRecord build() => _build();

  _$LanguagesRecord _build() {
    final _$result =
        _$v ?? new _$LanguagesRecord._(name: name, code: code, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
