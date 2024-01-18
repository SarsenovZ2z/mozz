import 'package:mozz/src/features/chat/domain/entities/chat_entity.dart';
import 'package:mozz/src/features/chat/domain/entities/message_entity.dart';

abstract class ChatDataSource {
  Future<List<ChatEntity>> fetchChats();

  Future<ChatEntity> fetchChat(int chatId);

  Future<List<MessageEntity>> fetchMessages(int chatId);

  Future<String> sendMessage({
    required int chatId,
    required String message,
    List<MessageEntity> context = const [],
  });
}
