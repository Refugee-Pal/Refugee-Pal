// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations18_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Translations18Record> _$translations18RecordSerializer =
    new _$Translations18RecordSerializer();

class _$Translations18RecordSerializer
    implements StructuredSerializer<Translations18Record> {
  @override
  final Iterable<Type> types = const [
    Translations18Record,
    _$Translations18Record
  ];
  @override
  final String wireName = 'Translations18Record';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, Translations18Record object,
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
  Translations18Record deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new Translations18RecordBuilder();

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

class _$Translations18Record extends Translations18Record {
  @override
  final String? value;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$Translations18Record(
          [void Function(Translations18RecordBuilder)? updates]) =>
      (new Translations18RecordBuilder()..update(updates))._build();

  _$Translations18Record._({this.value, this.ffRef}) : super._();

  @override
  Translations18Record rebuild(
          void Function(Translations18RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Translations18RecordBuilder toBuilder() =>
      new Translations18RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Translations18Record &&
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
    return (newBuiltValueToStringHelper(r'Translations18Record')
          ..add('value', value)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class Translations18RecordBuilder
    implements Builder<Translations18Record, Translations18RecordBuilder> {
  _$Translations18Record? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  Translations18RecordBuilder() {
    Translations18Record._initializeBuilder(this);
  }

  Translations18RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Translations18Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Translations18Record;
  }

  @override
  void update(void Function(Translations18RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Translations18Record build() => _build();

  _$Translations18Record _build() {
    final _$result =
        _$v ?? new _$Translations18Record._(value: value, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
