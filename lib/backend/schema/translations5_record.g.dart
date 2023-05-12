// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations5_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Translations5Record> _$translations5RecordSerializer =
    new _$Translations5RecordSerializer();

class _$Translations5RecordSerializer
    implements StructuredSerializer<Translations5Record> {
  @override
  final Iterable<Type> types = const [
    Translations5Record,
    _$Translations5Record
  ];
  @override
  final String wireName = 'Translations5Record';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, Translations5Record object,
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
  Translations5Record deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new Translations5RecordBuilder();

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

class _$Translations5Record extends Translations5Record {
  @override
  final String? value;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$Translations5Record(
          [void Function(Translations5RecordBuilder)? updates]) =>
      (new Translations5RecordBuilder()..update(updates))._build();

  _$Translations5Record._({this.value, this.ffRef}) : super._();

  @override
  Translations5Record rebuild(
          void Function(Translations5RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Translations5RecordBuilder toBuilder() =>
      new Translations5RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Translations5Record &&
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
    return (newBuiltValueToStringHelper(r'Translations5Record')
          ..add('value', value)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class Translations5RecordBuilder
    implements Builder<Translations5Record, Translations5RecordBuilder> {
  _$Translations5Record? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  Translations5RecordBuilder() {
    Translations5Record._initializeBuilder(this);
  }

  Translations5RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Translations5Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Translations5Record;
  }

  @override
  void update(void Function(Translations5RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Translations5Record build() => _build();

  _$Translations5Record _build() {
    final _$result =
        _$v ?? new _$Translations5Record._(value: value, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
