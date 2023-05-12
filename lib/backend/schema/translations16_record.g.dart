// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations16_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Translations16Record> _$translations16RecordSerializer =
    new _$Translations16RecordSerializer();

class _$Translations16RecordSerializer
    implements StructuredSerializer<Translations16Record> {
  @override
  final Iterable<Type> types = const [
    Translations16Record,
    _$Translations16Record
  ];
  @override
  final String wireName = 'Translations16Record';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, Translations16Record object,
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
  Translations16Record deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new Translations16RecordBuilder();

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

class _$Translations16Record extends Translations16Record {
  @override
  final String? value;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$Translations16Record(
          [void Function(Translations16RecordBuilder)? updates]) =>
      (new Translations16RecordBuilder()..update(updates))._build();

  _$Translations16Record._({this.value, this.ffRef}) : super._();

  @override
  Translations16Record rebuild(
          void Function(Translations16RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Translations16RecordBuilder toBuilder() =>
      new Translations16RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Translations16Record &&
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
    return (newBuiltValueToStringHelper(r'Translations16Record')
          ..add('value', value)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class Translations16RecordBuilder
    implements Builder<Translations16Record, Translations16RecordBuilder> {
  _$Translations16Record? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  Translations16RecordBuilder() {
    Translations16Record._initializeBuilder(this);
  }

  Translations16RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Translations16Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Translations16Record;
  }

  @override
  void update(void Function(Translations16RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Translations16Record build() => _build();

  _$Translations16Record _build() {
    final _$result =
        _$v ?? new _$Translations16Record._(value: value, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
