// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations2_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Translations2Record> _$translations2RecordSerializer =
    new _$Translations2RecordSerializer();

class _$Translations2RecordSerializer
    implements StructuredSerializer<Translations2Record> {
  @override
  final Iterable<Type> types = const [
    Translations2Record,
    _$Translations2Record
  ];
  @override
  final String wireName = 'Translations2Record';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, Translations2Record object,
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
  Translations2Record deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new Translations2RecordBuilder();

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

class _$Translations2Record extends Translations2Record {
  @override
  final String? value;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$Translations2Record(
          [void Function(Translations2RecordBuilder)? updates]) =>
      (new Translations2RecordBuilder()..update(updates))._build();

  _$Translations2Record._({this.value, this.ffRef}) : super._();

  @override
  Translations2Record rebuild(
          void Function(Translations2RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Translations2RecordBuilder toBuilder() =>
      new Translations2RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Translations2Record &&
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
    return (newBuiltValueToStringHelper(r'Translations2Record')
          ..add('value', value)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class Translations2RecordBuilder
    implements Builder<Translations2Record, Translations2RecordBuilder> {
  _$Translations2Record? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  Translations2RecordBuilder() {
    Translations2Record._initializeBuilder(this);
  }

  Translations2RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Translations2Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Translations2Record;
  }

  @override
  void update(void Function(Translations2RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Translations2Record build() => _build();

  _$Translations2Record _build() {
    final _$result =
        _$v ?? new _$Translations2Record._(value: value, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
