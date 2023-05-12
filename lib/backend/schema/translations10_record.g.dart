// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations10_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Translations10Record> _$translations10RecordSerializer =
    new _$Translations10RecordSerializer();

class _$Translations10RecordSerializer
    implements StructuredSerializer<Translations10Record> {
  @override
  final Iterable<Type> types = const [
    Translations10Record,
    _$Translations10Record
  ];
  @override
  final String wireName = 'Translations10Record';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, Translations10Record object,
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
  Translations10Record deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new Translations10RecordBuilder();

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

class _$Translations10Record extends Translations10Record {
  @override
  final String? value;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$Translations10Record(
          [void Function(Translations10RecordBuilder)? updates]) =>
      (new Translations10RecordBuilder()..update(updates))._build();

  _$Translations10Record._({this.value, this.ffRef}) : super._();

  @override
  Translations10Record rebuild(
          void Function(Translations10RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Translations10RecordBuilder toBuilder() =>
      new Translations10RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Translations10Record &&
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
    return (newBuiltValueToStringHelper(r'Translations10Record')
          ..add('value', value)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class Translations10RecordBuilder
    implements Builder<Translations10Record, Translations10RecordBuilder> {
  _$Translations10Record? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  Translations10RecordBuilder() {
    Translations10Record._initializeBuilder(this);
  }

  Translations10RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Translations10Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Translations10Record;
  }

  @override
  void update(void Function(Translations10RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Translations10Record build() => _build();

  _$Translations10Record _build() {
    final _$result =
        _$v ?? new _$Translations10Record._(value: value, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
