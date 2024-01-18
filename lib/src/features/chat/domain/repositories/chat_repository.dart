import 'package:dartz/dartz.dart';
import 'package:mozz/src/common/domain/entities/failure.dart';
import 'package:mozz/src/features/chat/domain/entities/chat_entity.dart';
import 'package:mozz/src/features/chat/domain/entities/message_entity.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<ChatEntity>>> fetchChats();

  Future<Either<Failure, ChatEntity>> fetchChat(int chatId);

  // TODO: add pagination
  Future<Either<Failure, List<MessageEntity>>> fetchMessages(int chatId);

  Future<Either<Failure, String>> sendMessage({
    required int chatId,
    required String message,
    List<MessageEntity> context = const [],
  });
}
