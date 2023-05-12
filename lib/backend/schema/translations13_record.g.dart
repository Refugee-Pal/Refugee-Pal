// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations13_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Translations13Record> _$translations13RecordSerializer =
    new _$Translations13RecordSerializer();

class _$Translations13RecordSerializer
    implements StructuredSerializer<Translations13Record> {
  @override
  final Iterable<Type> types = const [
    Translations13Record,
    _$Translations13Record
  ];
  @override
  final String wireName = 'Translations13Record';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, Translations13Record object,
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
  Translations13Record deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new Translations13RecordBuilder();

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

class _$Translations13Record extends Translations13Record {
  @override
  final String? value;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$Translations13Record(
          [void Function(Translations13RecordBuilder)? updates]) =>
      (new Translations13RecordBuilder()..update(updates))._build();

  _$Translations13Record._({this.value, this.ffRef}) : super._();

  @override
  Translations13Record rebuild(
          void Function(Translations13RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Translations13RecordBuilder toBuilder() =>
      new Translations13RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Translations13Record &&
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
    return (newBuiltValueToStringHelper(r'Translations13Record')
          ..add('value', value)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class Translations13RecordBuilder
    implements Builder<Translations13Record, Translations13RecordBuilder> {
  _$Translations13Record? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  Translations13RecordBuilder() {
    Translations13Record._initializeBuilder(this);
  }

  Translations13RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Translations13Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Translations13Record;
  }

  @override
  void update(void Function(Translations13RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Translations13Record build() => _build();

  _$Translations13Record _build() {
    final _$result =
        _$v ?? new _$Translations13Record._(value: value, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
