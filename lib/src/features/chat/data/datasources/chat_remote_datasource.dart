import 'package:mozz/src/common/data/datasources/remote_datasource.dart';
import 'package:mozz/src/features/chat/data/datasources/chat_datasource.dart';
import 'package:mozz/src/features/chat/domain/entities/chat_entity.dart';
import 'package:mozz/src/features/chat/domain/entities/message_entity.dart';

class ChatRemoteDataSource extends RemoteDataSource implements ChatDataSource {
  const ChatRemoteDataSource({
    required super.api,
  });

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
