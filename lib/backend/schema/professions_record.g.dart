// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professions_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProfessionsRecord> _$professionsRecordSerializer =
    new _$ProfessionsRecordSerializer();

class _$ProfessionsRecordSerializer
    implements StructuredSerializer<ProfessionsRecord> {
  @override
  final Iterable<Type> types = const [ProfessionsRecord, _$ProfessionsRecord];
  @override
  final String wireName = 'ProfessionsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProfessionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.icon;
    if (value != null) {
      result
        ..add('icon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.translated;
    if (value != null) {
      result
        ..add('translated')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  ProfessionsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProfessionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'translated':
          result.translated.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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

class _$ProfessionsRecord extends ProfessionsRecord {
  @override
  final String? name;
  @override
  final String? icon;
  @override
  final BuiltList<String>? translated;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ProfessionsRecord(
          [void Function(ProfessionsRecordBuilder)? updates]) =>
      (new ProfessionsRecordBuilder()..update(updates))._build();

  _$ProfessionsRecord._({this.name, this.icon, this.translated, this.ffRef})
      : super._();

  @override
  ProfessionsRecord rebuild(void Function(ProfessionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfessionsRecordBuilder toBuilder() =>
      new ProfessionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfessionsRecord &&
        name == other.name &&
        icon == other.icon &&
        translated == other.translated &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, translated.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProfessionsRecord')
          ..add('name', name)
          ..add('icon', icon)
          ..add('translated', translated)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ProfessionsRecordBuilder
    implements Builder<ProfessionsRecord, ProfessionsRecordBuilder> {
  _$ProfessionsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  ListBuilder<String>? _translated;
  ListBuilder<String> get translated =>
      _$this._translated ??= new ListBuilder<String>();
  set translated(ListBuilder<String>? translated) =>
      _$this._translated = translated;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ProfessionsRecordBuilder() {
    ProfessionsRecord._initializeBuilder(this);
  }

  ProfessionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _icon = $v.icon;
      _translated = $v.translated?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfessionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProfessionsRecord;
  }

  @override
  void update(void Function(ProfessionsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProfessionsRecord build() => _build();

  _$ProfessionsRecord _build() {
    _$ProfessionsRecord _$result;
    try {
      _$result = _$v ??
          new _$ProfessionsRecord._(
              name: name,
              icon: icon,
              translated: _translated?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'translated';
        _translated?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProfessionsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
