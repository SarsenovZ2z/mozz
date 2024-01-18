import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mozz/src/common/domain/entities/failure.dart';
import 'package:mozz/src/common/presentation/controllers/data_cubit.dart';
import 'package:mozz/src/common/presentation/controllers/data_states.dart';
import 'package:mozz/src/features/chat/domain/entities/chat_entity.dart';
import 'package:mozz/src/features/chat/domain/entities/message_entity.dart';
import 'package:mozz/src/features/chat/domain/usecases/fetch_messages.dart';
import 'package:mozz/src/features/chat/domain/usecases/send_message.dart';
import 'package:mozz/src/features/chat/presentation/controllers/chat_cubit.dart';

class LoadChatMessages extends Equatable {
  final int chatId;

  const LoadChatMessages(this.chatId);

  @override
  List<Object?> get props => [];
}

class ChatMessages extends Equatable {
  final List<MessageEntity> messages;

  const ChatMessages({required this.messages});

  ChatMessages addMessage(MessageEntity message) {
    return ChatMessages(messages: [message, ...messages]);
  }

  @override
  List<Object?> get props => [
        messages,
      ];
}

class ChatMessagesCubit extends DataCubit<ChatMessages, LoadChatMessages> {
  final FetchMessages fetchMessages;
  final SendMessage sendMessage;

  ChatMessagesCubit({
    required this.fetchMessages,
    required this.sendMessage,
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

  Future<void> tryToSendMessage(
    ChatEntity chat,
    String message,
  ) async {
    addMessage(
      MessageEntity(
        id: 7,
        message: message,
        isSentByUser: true,
        createdAt: DateTime.now(),
        readAt: null,
      ),
    );

    final currentState = state;
    if (currentState is! LoadedState<ChatMessages>) {
      return;
    }

    emit(LazyLoadingState<ChatMessages>(
      result: currentState.result,
      params: currentState.params,
    ));

    final failureOrReply = await sendMessage(
      SendMessageParams(
        chatId: chat.id,
        message: message,
        context: currentState.result.messages,
      ),
    );

    failureOrReply.fold(
      (failure) {
        //
      },
      (reply) {
        addMessage(
          MessageEntity(
            id: 7,
            message: reply,
            isSentByUser: false,
            createdAt: DateTime.now(),
            readAt: null,
          ),
        );
      },
    );
  }

  Future<void> addMessage(MessageEntity message) async {
    final currentState = state;
    if (currentState is! LoadedState<ChatMessages>) {
      return;
    }

    emit(
      LoadedState(
        params: currentState.params,
        result: currentState.result.addMessage(message),
      ),
    );
  }
}
