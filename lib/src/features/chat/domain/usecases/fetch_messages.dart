import 'package:dartz/dartz.dart';
import 'package:mozz/src/common/domain/usecases/usecase.dart';
import 'package:mozz/src/features/chat/domain/entities/message_entity.dart';
import 'package:mozz/src/features/chat/domain/repositories/chat_repository.dart';

class FetchMessages extends UseCase<Either<Exception, List<MessageEntity>>,
    FetchMessagesParams> {
  final ChatRepository chatRepository;

  const FetchMessages({
    required this.chatRepository,
  });

  @override
  Future<Either<Exception, List<MessageEntity>>> call(
    FetchMessagesParams params,
  ) {
    return chatRepository.fetchMessages(params.chatId);
  }
}

class FetchMessagesParams {
  final int chatId;

  const FetchMessagesParams(this.chatId);
}
