// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations1_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Translations1Record> _$translations1RecordSerializer =
    new _$Translations1RecordSerializer();

class _$Translations1RecordSerializer
    implements StructuredSerializer<Translations1Record> {
  @override
  final Iterable<Type> types = const [
    Translations1Record,
    _$Translations1Record
  ];
  @override
  final String wireName = 'Translations1Record';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, Translations1Record object,
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
  Translations1Record deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new Translations1RecordBuilder();

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

class _$Translations1Record extends Translations1Record {
  @override
  final String? value;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$Translations1Record(
          [void Function(Translations1RecordBuilder)? updates]) =>
      (new Translations1RecordBuilder()..update(updates))._build();

  _$Translations1Record._({this.value, this.ffRef}) : super._();

  @override
  Translations1Record rebuild(
          void Function(Translations1RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Translations1RecordBuilder toBuilder() =>
      new Translations1RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Translations1Record &&
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
    return (newBuiltValueToStringHelper(r'Translations1Record')
          ..add('value', value)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class Translations1RecordBuilder
    implements Builder<Translations1Record, Translations1RecordBuilder> {
  _$Translations1Record? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  Translations1RecordBuilder() {
    Translations1Record._initializeBuilder(this);
  }

  Translations1RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Translations1Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Translations1Record;
  }

  @override
  void update(void Function(Translations1RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Translations1Record build() => _build();

  _$Translations1Record _build() {
    final _$result =
        _$v ?? new _$Translations1Record._(value: value, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
