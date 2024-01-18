import 'package:dartz/dartz.dart';
import 'package:mozz/src/common/domain/entities/failure.dart';
import 'package:mozz/src/common/domain/usecases/usecase.dart';
import 'package:mozz/src/features/chat/domain/entities/chat_entity.dart';
import 'package:mozz/src/features/chat/domain/repositories/chat_repository.dart';

class FetchChat extends UseCase<Either<Failure, ChatEntity>, FetchChatParams> {
  final ChatRepository chatRepository;

  const FetchChat({
    required this.chatRepository,
  });

  @override
  Future<Either<Failure, ChatEntity>> call(FetchChatParams params) {
    return chatRepository.fetchChat(params.chatId);
  }
}

class FetchChatParams {
  final int chatId;

  const FetchChatParams(this.chatId);
}
