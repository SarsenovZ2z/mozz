import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mozz/src/common/domain/entities/failure.dart';
import 'package:mozz/src/common/presentation/controllers/data_cubit.dart';
import 'package:mozz/src/common/presentation/controllers/data_states.dart';
import 'package:mozz/src/features/chat/domain/entities/message_entity.dart';
import 'package:mozz/src/features/chat/domain/usecases/fetch_messages.dart';

class LoadChatMessages extends Equatable {
  final int chatId;

  const LoadChatMessages(this.chatId);

  @override
  List<Object?> get props => [];
}

class ChatMessages extends Equatable {
  final List<MessageEntity> messages;

  const ChatMessages({required this.messages});

  @override
  List<Object?> get props => [
        messages,
      ];
}

class ChatMessagesCubit extends DataCubit<ChatMessages, LoadChatMessages> {
  final FetchMessages fetchMessages;

  ChatMessagesCubit({
    required this.fetchMessages,
  });

  @override
  bool canLazyLoad(LoadedState<ChatMessages> state) {
    return false;
  }

  @override
  Future<Either<Failure, dynamic>> fetch(
    LoadChatMessages params,
    LoadedState<ChatMessages>? oldState,
  ) {
    return fetchMessages(
      FetchMessagesParams(params.chatId),
    );
  }

  @override
  Future<DataState<ChatMessages>> getLoadedState(
    LoadChatMessages params,
    LoadedState<ChatMessages>? oldState,
    data,
  ) async {
    return LoadedState(
      params: params,
      result: ChatMessages(
        messages: data,
      ),
    );
  }
}
