import 'package:mozz/src/features/chat/domain/entities/chat_entity.dart';
import 'package:mozz/src/features/chat/domain/entities/message_entity.dart';

abstract class ChatDataSource {
  Future<List<ChatEntity>> fetchChats();

  Future<List<MessageEntity>> fetchMessages(int chatId);
}