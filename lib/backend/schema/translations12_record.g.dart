// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations12_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Translations12Record> _$translations12RecordSerializer =
    new _$Translations12RecordSerializer();

class _$Translations12RecordSerializer
    implements StructuredSerializer<Translations12Record> {
  @override
  final Iterable<Type> types = const [
    Translations12Record,
    _$Translations12Record
  ];
  @override
  final String wireName = 'Translations12Record';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, Translations12Record object,
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
  Translations12Record deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new Translations12RecordBuilder();

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

class _$Translations12Record extends Translations12Record {
  @override
  final String? value;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$Translations12Record(
          [void Function(Translations12RecordBuilder)? updates]) =>
      (new Translations12RecordBuilder()..update(updates))._build();

  _$Translations12Record._({this.value, this.ffRef}) : super._();

  @override
  Translations12Record rebuild(
          void Function(Translations12RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Translations12RecordBuilder toBuilder() =>
      new Translations12RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Translations12Record &&
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
    return (newBuiltValueToStringHelper(r'Translations12Record')
          ..add('value', value)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class Translations12RecordBuilder
    implements Builder<Translations12Record, Translations12RecordBuilder> {
  _$Translations12Record? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  Translations12RecordBuilder() {
    Translations12Record._initializeBuilder(this);
  }

  Translations12RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Translations12Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Translations12Record;
  }

  @override
  void update(void Function(Translations12RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Translations12Record build() => _build();

  _$Translations12Record _build() {
    final _$result =
        _$v ?? new _$Translations12Record._(value: value, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
