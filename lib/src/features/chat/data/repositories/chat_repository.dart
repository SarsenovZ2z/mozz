import 'package:dartz/dartz.dart';
import 'package:mozz/src/common/domain/entities/failure.dart';
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
  Future<Either<Failure, List<ChatEntity>>> fetchChats() async {
    try {
      return Right(await chatDataSource.fetchChats());
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnexpectedFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<MessageEntity>>> fetchMessages(int chatId) async {
    try {
      return Right(await chatDataSource.fetchMessages(chatId));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnexpectedFailure(e));
    }
  }

  @override
  Future<Either<Failure, ChatEntity>> fetchChat(int chatId) async {
    try {
      return Right(await chatDataSource.fetchChat(chatId));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnexpectedFailure(e));
    }
  }

  @override
  Future<Either<Failure, String>> sendMessage({
    required int chatId,
    required String message,
    List<MessageEntity> context = const [],
  }) async {
    try {
      return Right(await chatDataSource.sendMessage(
        chatId: chatId,
        message: message,
        context: context,
      ));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnexpectedFailure(e));
    }
  }
}
