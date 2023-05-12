// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations8_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Translations8Record> _$translations8RecordSerializer =
    new _$Translations8RecordSerializer();

class _$Translations8RecordSerializer
    implements StructuredSerializer<Translations8Record> {
  @override
  final Iterable<Type> types = const [
    Translations8Record,
    _$Translations8Record
  ];
  @override
  final String wireName = 'Translations8Record';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, Translations8Record object,
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
  Translations8Record deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new Translations8RecordBuilder();

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

class _$Translations8Record extends Translations8Record {
  @override
  final String? value;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$Translations8Record(
          [void Function(Translations8RecordBuilder)? updates]) =>
      (new Translations8RecordBuilder()..update(updates))._build();

  _$Translations8Record._({this.value, this.ffRef}) : super._();

  @override
  Translations8Record rebuild(
          void Function(Translations8RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Translations8RecordBuilder toBuilder() =>
      new Translations8RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Translations8Record &&
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
    return (newBuiltValueToStringHelper(r'Translations8Record')
          ..add('value', value)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class Translations8RecordBuilder
    implements Builder<Translations8Record, Translations8RecordBuilder> {
  _$Translations8Record? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  Translations8RecordBuilder() {
    Translations8Record._initializeBuilder(this);
  }

  Translations8RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Translations8Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Translations8Record;
  }

  @override
  void update(void Function(Translations8RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Translations8Record build() => _build();

  _$Translations8Record _build() {
    final _$result =
        _$v ?? new _$Translations8Record._(value: value, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
