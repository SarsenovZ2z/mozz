import 'package:mozz/src/features/chat/data/datasources/chat_datasource.dart';
import 'package:mozz/src/features/chat/domain/entities/chat_entity.dart';
import 'package:mozz/src/features/chat/domain/entities/message_entity.dart';

class ChatMemoryDataSource implements ChatDataSource {
  @override
  Future<List<ChatEntity>> fetchChats() {
    // TODO: implement fetchChats
    throw UnimplementedError();
  }

  @override
  Future<List<MessageEntity>> fetchMessages(int chatId) {
    // TODO: implement fetchMessages
    throw UnimplementedError();
  }

}