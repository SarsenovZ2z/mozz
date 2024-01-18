import 'package:dartz/dartz.dart';
import 'package:mozz/src/features/chat/domain/entities/chat_entity.dart';
import 'package:mozz/src/features/chat/domain/entities/message_entity.dart';

abstract class ChatRepository {
  Future<Either<Exception, List<ChatEntity>>> fetchChats();

  // TODO: add pagination
  Future<Either<Exception, List<MessageEntity>>> fetchMessages(int chatId);
}