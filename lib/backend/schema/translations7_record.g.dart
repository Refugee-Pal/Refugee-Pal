// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations7_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Translations7Record> _$translations7RecordSerializer =
    new _$Translations7RecordSerializer();

class _$Translations7RecordSerializer
    implements StructuredSerializer<Translations7Record> {
  @override
  final Iterable<Type> types = const [
    Translations7Record,
    _$Translations7Record
  ];
  @override
  final String wireName = 'Translations7Record';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, Translations7Record object,
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
  Translations7Record deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new Translations7RecordBuilder();

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

class _$Translations7Record extends Translations7Record {
  @override
  final String? value;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$Translations7Record(
          [void Function(Translations7RecordBuilder)? updates]) =>
      (new Translations7RecordBuilder()..update(updates))._build();

  _$Translations7Record._({this.value, this.ffRef}) : super._();

  @override
  Translations7Record rebuild(
          void Function(Translations7RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Translations7RecordBuilder toBuilder() =>
      new Translations7RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Translations7Record &&
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
    return (newBuiltValueToStringHelper(r'Translations7Record')
          ..add('value', value)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class Translations7RecordBuilder
    implements Builder<Translations7Record, Translations7RecordBuilder> {
  _$Translations7Record? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  Translations7RecordBuilder() {
    Translations7Record._initializeBuilder(this);
  }

  Translations7RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Translations7Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Translations7Record;
  }

  @override
  void update(void Function(Translations7RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Translations7Record build() => _build();

  _$Translations7Record _build() {
    final _$result =
        _$v ?? new _$Translations7Record._(value: value, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
