// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations4_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Translations4Record> _$translations4RecordSerializer =
    new _$Translations4RecordSerializer();

class _$Translations4RecordSerializer
    implements StructuredSerializer<Translations4Record> {
  @override
  final Iterable<Type> types = const [
    Translations4Record,
    _$Translations4Record
  ];
  @override
  final String wireName = 'Translations4Record';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, Translations4Record object,
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
  Translations4Record deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new Translations4RecordBuilder();

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

class _$Translations4Record extends Translations4Record {
  @override
  final String? value;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$Translations4Record(
          [void Function(Translations4RecordBuilder)? updates]) =>
      (new Translations4RecordBuilder()..update(updates))._build();

  _$Translations4Record._({this.value, this.ffRef}) : super._();

  @override
  Translations4Record rebuild(
          void Function(Translations4RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Translations4RecordBuilder toBuilder() =>
      new Translations4RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Translations4Record &&
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
    return (newBuiltValueToStringHelper(r'Translations4Record')
          ..add('value', value)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class Translations4RecordBuilder
    implements Builder<Translations4Record, Translations4RecordBuilder> {
  _$Translations4Record? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  Translations4RecordBuilder() {
    Translations4Record._initializeBuilder(this);
  }

  Translations4RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Translations4Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Translations4Record;
  }

  @override
  void update(void Function(Translations4RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Translations4Record build() => _build();

  _$Translations4Record _build() {
    final _$result =
        _$v ?? new _$Translations4Record._(value: value, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
