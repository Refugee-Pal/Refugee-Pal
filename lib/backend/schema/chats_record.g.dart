// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChatsRecord> _$chatsRecordSerializer = new _$ChatsRecordSerializer();

class _$ChatsRecordSerializer implements StructuredSerializer<ChatsRecord> {
  @override
  final Iterable<Type> types = const [ChatsRecord, _$ChatsRecord];
  @override
  final String wireName = 'ChatsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ChatsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.lastmessage;
    if (value != null) {
      result
        ..add('lastmessage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastmessagetime;
    if (value != null) {
      result
        ..add('lastmessagetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.users;
    if (value != null) {
      result
        ..add('users')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.lastmessageuser;
    if (value != null) {
      result
        ..add('lastmessageuser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categories;
    if (value != null) {
      result
        ..add('categories')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.preexistingTimestamps;
    if (value != null) {
      result
        ..add('preexistingTimestamps')
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
  ChatsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'lastmessage':
          result.lastmessage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lastmessagetime':
          result.lastmessagetime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'users':
          result.users.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'lastmessageuser':
          result.lastmessageuser = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'categories':
          result.categories.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'preexistingTimestamps':
          result.preexistingTimestamps.replace(serializers.deserialize(value,
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

class _$ChatsRecord extends ChatsRecord {
  @override
  final String? lastmessage;
  @override
  final DateTime? lastmessagetime;
  @override
  final String? name;
  @override
  final BuiltList<String>? users;
  @override
  final String? lastmessageuser;
  @override
  final String? type;
  @override
  final BuiltList<String>? categories;
  @override
  final BuiltList<String>? preexistingTimestamps;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ChatsRecord([void Function(ChatsRecordBuilder)? updates]) =>
      (new ChatsRecordBuilder()..update(updates))._build();

  _$ChatsRecord._(
      {this.lastmessage,
      this.lastmessagetime,
      this.name,
      this.users,
      this.lastmessageuser,
      this.type,
      this.categories,
      this.preexistingTimestamps,
      this.ffRef})
      : super._();

  @override
  ChatsRecord rebuild(void Function(ChatsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatsRecordBuilder toBuilder() => new ChatsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatsRecord &&
        lastmessage == other.lastmessage &&
        lastmessagetime == other.lastmessagetime &&
        name == other.name &&
        users == other.users &&
        lastmessageuser == other.lastmessageuser &&
        type == other.type &&
        categories == other.categories &&
        preexistingTimestamps == other.preexistingTimestamps &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, lastmessage.hashCode);
    _$hash = $jc(_$hash, lastmessagetime.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, users.hashCode);
    _$hash = $jc(_$hash, lastmessageuser.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, categories.hashCode);
    _$hash = $jc(_$hash, preexistingTimestamps.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatsRecord')
          ..add('lastmessage', lastmessage)
          ..add('lastmessagetime', lastmessagetime)
          ..add('name', name)
          ..add('users', users)
          ..add('lastmessageuser', lastmessageuser)
          ..add('type', type)
          ..add('categories', categories)
          ..add('preexistingTimestamps', preexistingTimestamps)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ChatsRecordBuilder implements Builder<ChatsRecord, ChatsRecordBuilder> {
  _$ChatsRecord? _$v;

  String? _lastmessage;
  String? get lastmessage => _$this._lastmessage;
  set lastmessage(String? lastmessage) => _$this._lastmessage = lastmessage;

  DateTime? _lastmessagetime;
  DateTime? get lastmessagetime => _$this._lastmessagetime;
  set lastmessagetime(DateTime? lastmessagetime) =>
      _$this._lastmessagetime = lastmessagetime;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<String>? _users;
  ListBuilder<String> get users => _$this._users ??= new ListBuilder<String>();
  set users(ListBuilder<String>? users) => _$this._users = users;

  String? _lastmessageuser;
  String? get lastmessageuser => _$this._lastmessageuser;
  set lastmessageuser(String? lastmessageuser) =>
      _$this._lastmessageuser = lastmessageuser;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  ListBuilder<String>? _categories;
  ListBuilder<String> get categories =>
      _$this._categories ??= new ListBuilder<String>();
  set categories(ListBuilder<String>? categories) =>
      _$this._categories = categories;

  ListBuilder<String>? _preexistingTimestamps;
  ListBuilder<String> get preexistingTimestamps =>
      _$this._preexistingTimestamps ??= new ListBuilder<String>();
  set preexistingTimestamps(ListBuilder<String>? preexistingTimestamps) =>
      _$this._preexistingTimestamps = preexistingTimestamps;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ChatsRecordBuilder() {
    ChatsRecord._initializeBuilder(this);
  }

  ChatsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lastmessage = $v.lastmessage;
      _lastmessagetime = $v.lastmessagetime;
      _name = $v.name;
      _users = $v.users?.toBuilder();
      _lastmessageuser = $v.lastmessageuser;
      _type = $v.type;
      _categories = $v.categories?.toBuilder();
      _preexistingTimestamps = $v.preexistingTimestamps?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatsRecord;
  }

  @override
  void update(void Function(ChatsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatsRecord build() => _build();

  _$ChatsRecord _build() {
    _$ChatsRecord _$result;
    try {
      _$result = _$v ??
          new _$ChatsRecord._(
              lastmessage: lastmessage,
              lastmessagetime: lastmessagetime,
              name: name,
              users: _users?.build(),
              lastmessageuser: lastmessageuser,
              type: type,
              categories: _categories?.build(),
              preexistingTimestamps: _preexistingTimestamps?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        _users?.build();

        _$failedField = 'categories';
        _categories?.build();
        _$failedField = 'preexistingTimestamps';
        _preexistingTimestamps?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ChatsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
