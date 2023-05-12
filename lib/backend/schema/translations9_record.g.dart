// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations9_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Translations9Record> _$translations9RecordSerializer =
    new _$Translations9RecordSerializer();

class _$Translations9RecordSerializer
    implements StructuredSerializer<Translations9Record> {
  @override
  final Iterable<Type> types = const [
    Translations9Record,
    _$Translations9Record
  ];
  @override
  final String wireName = 'Translations9Record';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, Translations9Record object,
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
  Translations9Record deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new Translations9RecordBuilder();

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

class _$Translations9Record extends Translations9Record {
  @override
  final String? value;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$Translations9Record(
          [void Function(Translations9RecordBuilder)? updates]) =>
      (new Translations9RecordBuilder()..update(updates))._build();

  _$Translations9Record._({this.value, this.ffRef}) : super._();

  @override
  Translations9Record rebuild(
          void Function(Translations9RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Translations9RecordBuilder toBuilder() =>
      new Translations9RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Translations9Record &&
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
    return (newBuiltValueToStringHelper(r'Translations9Record')
          ..add('value', value)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class Translations9RecordBuilder
    implements Builder<Translations9Record, Translations9RecordBuilder> {
  _$Translations9Record? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  Translations9RecordBuilder() {
    Translations9Record._initializeBuilder(this);
  }

  Translations9RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Translations9Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Translations9Record;
  }

  @override
  void update(void Function(Translations9RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Translations9Record build() => _build();

  _$Translations9Record _build() {
    final _$result =
        _$v ?? new _$Translations9Record._(value: value, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
