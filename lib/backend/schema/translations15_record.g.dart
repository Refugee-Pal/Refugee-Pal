// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations15_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Translations15Record> _$translations15RecordSerializer =
    new _$Translations15RecordSerializer();

class _$Translations15RecordSerializer
    implements StructuredSerializer<Translations15Record> {
  @override
  final Iterable<Type> types = const [
    Translations15Record,
    _$Translations15Record
  ];
  @override
  final String wireName = 'Translations15Record';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, Translations15Record object,
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
  Translations15Record deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new Translations15RecordBuilder();

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

class _$Translations15Record extends Translations15Record {
  @override
  final String? value;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$Translations15Record(
          [void Function(Translations15RecordBuilder)? updates]) =>
      (new Translations15RecordBuilder()..update(updates))._build();

  _$Translations15Record._({this.value, this.ffRef}) : super._();

  @override
  Translations15Record rebuild(
          void Function(Translations15RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Translations15RecordBuilder toBuilder() =>
      new Translations15RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Translations15Record &&
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
    return (newBuiltValueToStringHelper(r'Translations15Record')
          ..add('value', value)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class Translations15RecordBuilder
    implements Builder<Translations15Record, Translations15RecordBuilder> {
  _$Translations15Record? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  Translations15RecordBuilder() {
    Translations15Record._initializeBuilder(this);
  }

  Translations15RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Translations15Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Translations15Record;
  }

  @override
  void update(void Function(Translations15RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Translations15Record build() => _build();

  _$Translations15Record _build() {
    final _$result =
        _$v ?? new _$Translations15Record._(value: value, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
