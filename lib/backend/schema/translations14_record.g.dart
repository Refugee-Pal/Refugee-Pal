// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations14_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Translations14Record> _$translations14RecordSerializer =
    new _$Translations14RecordSerializer();

class _$Translations14RecordSerializer
    implements StructuredSerializer<Translations14Record> {
  @override
  final Iterable<Type> types = const [
    Translations14Record,
    _$Translations14Record
  ];
  @override
  final String wireName = 'Translations14Record';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, Translations14Record object,
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
  Translations14Record deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new Translations14RecordBuilder();

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

class _$Translations14Record extends Translations14Record {
  @override
  final String? value;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$Translations14Record(
          [void Function(Translations14RecordBuilder)? updates]) =>
      (new Translations14RecordBuilder()..update(updates))._build();

  _$Translations14Record._({this.value, this.ffRef}) : super._();

  @override
  Translations14Record rebuild(
          void Function(Translations14RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Translations14RecordBuilder toBuilder() =>
      new Translations14RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Translations14Record &&
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
    return (newBuiltValueToStringHelper(r'Translations14Record')
          ..add('value', value)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class Translations14RecordBuilder
    implements Builder<Translations14Record, Translations14RecordBuilder> {
  _$Translations14Record? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  Translations14RecordBuilder() {
    Translations14Record._initializeBuilder(this);
  }

  Translations14RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Translations14Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Translations14Record;
  }

  @override
  void update(void Function(Translations14RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Translations14Record build() => _build();

  _$Translations14Record _build() {
    final _$result =
        _$v ?? new _$Translations14Record._(value: value, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
