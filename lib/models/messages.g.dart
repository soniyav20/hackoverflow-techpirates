// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Messages> _$messagesSerializer = new _$MessagesSerializer();

class _$MessagesSerializer implements StructuredSerializer<Messages> {
  @override
  final Iterable<Type> types = const [Messages, _$Messages];
  @override
  final String wireName = 'Messages';

  @override
  Iterable<Object?> serialize(Serializers serializers, Messages object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'hrid',
      serializers.serialize(object.hrid, specifiedType: const FullType(String)),
      'empid',
      serializers.serialize(object.empid,
          specifiedType: const FullType(String)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'isempSender',
      serializers.serialize(object.isempSender,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  Messages deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MessagesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'hrid':
          result.hrid = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'empid':
          result.empid = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'isempSender':
          result.isempSender = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$Messages extends Messages {
  @override
  final String hrid;
  @override
  final String empid;
  @override
  final String message;
  @override
  final bool isempSender;

  factory _$Messages([void Function(MessagesBuilder)? updates]) =>
      (new MessagesBuilder()..update(updates))._build();

  _$Messages._(
      {required this.hrid,
      required this.empid,
      required this.message,
      required this.isempSender})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(hrid, r'Messages', 'hrid');
    BuiltValueNullFieldError.checkNotNull(empid, r'Messages', 'empid');
    BuiltValueNullFieldError.checkNotNull(message, r'Messages', 'message');
    BuiltValueNullFieldError.checkNotNull(
        isempSender, r'Messages', 'isempSender');
  }

  @override
  Messages rebuild(void Function(MessagesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessagesBuilder toBuilder() => new MessagesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Messages &&
        hrid == other.hrid &&
        empid == other.empid &&
        message == other.message &&
        isempSender == other.isempSender;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, hrid.hashCode);
    _$hash = $jc(_$hash, empid.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, isempSender.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Messages')
          ..add('hrid', hrid)
          ..add('empid', empid)
          ..add('message', message)
          ..add('isempSender', isempSender))
        .toString();
  }
}

class MessagesBuilder implements Builder<Messages, MessagesBuilder> {
  _$Messages? _$v;

  String? _hrid;
  String? get hrid => _$this._hrid;
  set hrid(String? hrid) => _$this._hrid = hrid;

  String? _empid;
  String? get empid => _$this._empid;
  set empid(String? empid) => _$this._empid = empid;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _isempSender;
  bool? get isempSender => _$this._isempSender;
  set isempSender(bool? isempSender) => _$this._isempSender = isempSender;

  MessagesBuilder();

  MessagesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _hrid = $v.hrid;
      _empid = $v.empid;
      _message = $v.message;
      _isempSender = $v.isempSender;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Messages other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Messages;
  }

  @override
  void update(void Function(MessagesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Messages build() => _build();

  _$Messages _build() {
    final _$result = _$v ??
        new _$Messages._(
            hrid: BuiltValueNullFieldError.checkNotNull(
                hrid, r'Messages', 'hrid'),
            empid: BuiltValueNullFieldError.checkNotNull(
                empid, r'Messages', 'empid'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'Messages', 'message'),
            isempSender: BuiltValueNullFieldError.checkNotNull(
                isempSender, r'Messages', 'isempSender'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
