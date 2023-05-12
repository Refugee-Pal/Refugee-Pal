// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations19_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Translations19Record> _$translations19RecordSerializer =
    new _$Translations19RecordSerializer();

class _$Translations19RecordSerializer
    implements StructuredSerializer<Translations19Record> {
  @override
  final Iterable<Type> types = const [
    Translations19Record,
    _$Translations19Record
  ];
  @override
  final String wireName = 'Translations19Record';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, Translations19Record object,
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
  Translations19Record deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new Translations19RecordBuilder();

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

class _$Translations19Record extends Translations19Record {
  @override
  final String? value;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$Translations19Record(
          [void Function(Translations19RecordBuilder)? updates]) =>
      (new Translations19RecordBuilder()..update(updates))._build();

  _$Translations19Record._({this.value, this.ffRef}) : super._();

  @override
  Translations19Record rebuild(
          void Function(Translations19RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Translations19RecordBuilder toBuilder() =>
      new Translations19RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Translations19Record &&
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
    return (newBuiltValueToStringHelper(r'Translations19Record')
          ..add('value', value)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class Translations19RecordBuilder
    implements Builder<Translations19Record, Translations19RecordBuilder> {
  _$Translations19Record? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  Translations19RecordBuilder() {
    Translations19Record._initializeBuilder(this);
  }

  Translations19RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Translations19Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Translations19Record;
  }

  @override
  void update(void Function(Translations19RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Translations19Record build() => _build();

  _$Translations19Record _build() {
    final _$result =
        _$v ?? new _$Translations19Record._(value: value, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
