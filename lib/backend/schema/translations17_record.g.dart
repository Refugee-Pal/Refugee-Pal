// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations17_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Translations17Record> _$translations17RecordSerializer =
    new _$Translations17RecordSerializer();

class _$Translations17RecordSerializer
    implements StructuredSerializer<Translations17Record> {
  @override
  final Iterable<Type> types = const [
    Translations17Record,
    _$Translations17Record
  ];
  @override
  final String wireName = 'Translations17Record';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, Translations17Record object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.value;
    if (value != null) {
      result
        ..add('value')
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
  Translations17Record deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new Translations17RecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
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

class _$Translations17Record extends Translations17Record {
  @override
  final String? value;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$Translations17Record(
          [void Function(Translations17RecordBuilder)? updates]) =>
      (new Translations17RecordBuilder()..update(updates))._build();

  _$Translations17Record._({this.value, this.ffRef}) : super._();

  @override
  Translations17Record rebuild(
          void Function(Translations17RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Translations17RecordBuilder toBuilder() =>
      new Translations17RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Translations17Record &&
        value == other.value &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Translations17Record')
          ..add('value', value)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class Translations17RecordBuilder
    implements Builder<Translations17Record, Translations17RecordBuilder> {
  _$Translations17Record? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  Translations17RecordBuilder() {
    Translations17Record._initializeBuilder(this);
  }

  Translations17RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Translations17Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Translations17Record;
  }

  @override
  void update(void Function(Translations17RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Translations17Record build() => _build();

  _$Translations17Record _build() {
    final _$result =
        _$v ?? new _$Translations17Record._(value: value, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
