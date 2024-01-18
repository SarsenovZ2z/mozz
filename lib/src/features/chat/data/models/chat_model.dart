import 'package:mozz/src/features/chat/data/models/message_model.dart';
import 'package:mozz/src/features/chat/domain/entities/chat_entity.dart';

class ChatModel extends ChatEntity {
  const ChatModel({
    required super.id,
    required super.name,
    required super.lastMessage,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        id: json['id'],
        name: json['name'],
        lastMessage: json['last_message']
            ? MessageModel.fromJson(json['last_message'])
            : null,
      );
}
