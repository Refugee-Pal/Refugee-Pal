// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations3_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Translations3Record> _$translations3RecordSerializer =
    new _$Translations3RecordSerializer();

class _$Translations3RecordSerializer
    implements StructuredSerializer<Translations3Record> {
  @override
  final Iterable<Type> types = const [
    Translations3Record,
    _$Translations3Record
  ];
  @override
  final String wireName = 'Translations3Record';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, Translations3Record object,
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
  Translations3Record deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new Translations3RecordBuilder();

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

class _$Translations3Record extends Translations3Record {
  @override
  final String? value;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$Translations3Record(
          [void Function(Translations3RecordBuilder)? updates]) =>
      (new Translations3RecordBuilder()..update(updates))._build();

  _$Translations3Record._({this.value, this.ffRef}) : super._();

  @override
  Translations3Record rebuild(
          void Function(Translations3RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Translations3RecordBuilder toBuilder() =>
      new Translations3RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Translations3Record &&
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
    return (newBuiltValueToStringHelper(r'Translations3Record')
          ..add('value', value)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class Translations3RecordBuilder
    implements Builder<Translations3Record, Translations3RecordBuilder> {
  _$Translations3Record? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  Translations3RecordBuilder() {
    Translations3Record._initializeBuilder(this);
  }

  Translations3RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Translations3Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Translations3Record;
  }

  @override
  void update(void Function(Translations3RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Translations3Record build() => _build();

  _$Translations3Record _build() {
    final _$result =
        _$v ?? new _$Translations3Record._(value: value, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
