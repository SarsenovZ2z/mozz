import 'package:dartz/dartz.dart';
import 'package:mozz/src/common/domain/entities/failure.dart';
import 'package:mozz/src/common/domain/usecases/usecase.dart';
import 'package:mozz/src/features/chat/domain/entities/message_entity.dart';
import 'package:mozz/src/features/chat/domain/repositories/chat_repository.dart';

class SendMessage extends UseCase<Either<Failure, String>, SendMessageParams> {
  final ChatRepository chatRepository;

  const SendMessage({
    required this.chatRepository,
  });

  @override
  Future<Either<Failure, String>> call(SendMessageParams params) {
    return chatRepository.sendMessage(
      chatId: params.chatId,
      message: params.message,
      context: params.context,
    );
  }
}

class SendMessageParams {
  final int chatId;
  final String message;
  final List<MessageEntity> context;

  const SendMessageParams({
    required this.chatId,
    required this.message,
    this.context = const [],
  });
}
