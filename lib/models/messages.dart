import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:encrypt/encrypt.dart';
import 'package:project_inc/models/serializers.dart';

part 'messages.g.dart';

abstract class Messages implements Built<Messages, MessagesBuilder> {
  Messages._();
  factory Messages([void Function(MessagesBuilder) updates]) = _$Messages;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Messages.serializer, this)
        as Map<String, dynamic>;
  }

  static Messages fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Messages.serializer, json)!;
  }

  static Serializer<Messages> get serializer => _$messagesSerializer;
  String get hrid;
  String get empid;
  String get message;
  bool get isempSender;
  String? get time;
}
