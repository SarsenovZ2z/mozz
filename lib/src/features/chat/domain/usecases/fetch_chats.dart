import 'package:dartz/dartz.dart';
import 'package:mozz/src/common/domain/entities/failure.dart';
import 'package:mozz/src/common/domain/usecases/usecase_without_params.dart';
import 'package:mozz/src/features/chat/domain/entities/chat_entity.dart';
import 'package:mozz/src/features/chat/domain/repositories/chat_repository.dart';

class FetchChats
    extends UseCaseWithoutParams<Either<Failure, List<ChatEntity>>> {
  final ChatRepository chatRepository;

  const FetchChats({
    required this.chatRepository,
  });

  @override
  Future<Either<Failure, List<ChatEntity>>> call() {
    return chatRepository.fetchChats();
  }
}
