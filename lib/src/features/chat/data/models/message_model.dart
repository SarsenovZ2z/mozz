import 'package:mozz/src/features/chat/domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  const MessageModel({
    required super.id,
    required super.message,
    required super.isSentByUser,
    required super.createdAt,
    required super.readAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        id: json['id'],
        message: json['message'],
        isSentByUser: json['is_sent_by_user'],
        createdAt: DateTime.parse(json['created_at']),
        readAt: DateTime.tryParse(json['read_at'] ?? ''),
      );
}
