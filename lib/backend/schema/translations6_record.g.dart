// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations6_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Translations6Record> _$translations6RecordSerializer =
    new _$Translations6RecordSerializer();

class _$Translations6RecordSerializer
    implements StructuredSerializer<Translations6Record> {
  @override
  final Iterable<Type> types = const [
    Translations6Record,
    _$Translations6Record
  ];
  @override
  final String wireName = 'Translations6Record';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, Translations6Record object,
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
  Translations6Record deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new Translations6RecordBuilder();

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

class _$Translations6Record extends Translations6Record {
  @override
  final String? value;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$Translations6Record(
          [void Function(Translations6RecordBuilder)? updates]) =>
      (new Translations6RecordBuilder()..update(updates))._build();

  _$Translations6Record._({this.value, this.ffRef}) : super._();

  @override
  Translations6Record rebuild(
          void Function(Translations6RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Translations6RecordBuilder toBuilder() =>
      new Translations6RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Translations6Record &&
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
    return (newBuiltValueToStringHelper(r'Translations6Record')
          ..add('value', value)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class Translations6RecordBuilder
    implements Builder<Translations6Record, Translations6RecordBuilder> {
  _$Translations6Record? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  Translations6RecordBuilder() {
    Translations6Record._initializeBuilder(this);
  }

  Translations6RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Translations6Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Translations6Record;
  }

  @override
  void update(void Function(Translations6RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Translations6Record build() => _build();

  _$Translations6Record _build() {
    final _$result =
        _$v ?? new _$Translations6Record._(value: value, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
