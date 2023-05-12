// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations11_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Translations11Record> _$translations11RecordSerializer =
    new _$Translations11RecordSerializer();

class _$Translations11RecordSerializer
    implements StructuredSerializer<Translations11Record> {
  @override
  final Iterable<Type> types = const [
    Translations11Record,
    _$Translations11Record
  ];
  @override
  final String wireName = 'Translations11Record';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, Translations11Record object,
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
  Translations11Record deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new Translations11RecordBuilder();

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

class _$Translations11Record extends Translations11Record {
  @override
  final String? value;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$Translations11Record(
          [void Function(Translations11RecordBuilder)? updates]) =>
      (new Translations11RecordBuilder()..update(updates))._build();

  _$Translations11Record._({this.value, this.ffRef}) : super._();

  @override
  Translations11Record rebuild(
          void Function(Translations11RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Translations11RecordBuilder toBuilder() =>
      new Translations11RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Translations11Record &&
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
    return (newBuiltValueToStringHelper(r'Translations11Record')
          ..add('value', value)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class Translations11RecordBuilder
    implements Builder<Translations11Record, Translations11RecordBuilder> {
  _$Translations11Record? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  Translations11RecordBuilder() {
    Translations11Record._initializeBuilder(this);
  }

  Translations11RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Translations11Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Translations11Record;
  }

  @override
  void update(void Function(Translations11RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Translations11Record build() => _build();

  _$Translations11Record _build() {
    final _$result =
        _$v ?? new _$Translations11Record._(value: value, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
