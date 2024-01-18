import 'package:dartz/dartz.dart';
import 'package:mozz/src/features/chat/data/datasources/chat_datasource.dart';
import 'package:mozz/src/features/chat/domain/entities/chat_entity.dart';
import 'package:mozz/src/features/chat/domain/entities/message_entity.dart';
import 'package:mozz/src/features/chat/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatDataSource chatDataSource;

  const ChatRepositoryImpl({
    required this.chatDataSource,
  });

  @override
  Future<Either<Exception, List<ChatEntity>>> fetchChats() {
    // TODO: implement fetchChats
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, List<MessageEntity>>> fetchMessages(int chatId) {
    // TODO: implement fetchMessages
    throw UnimplementedError();
  }
}
