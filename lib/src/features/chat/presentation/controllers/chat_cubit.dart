import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mozz/src/common/domain/entities/failure.dart';
import 'package:mozz/src/common/presentation/controllers/data_cubit.dart';
import 'package:mozz/src/common/presentation/controllers/data_states.dart';
import 'package:mozz/src/features/chat/domain/entities/chat_entity.dart';
import 'package:mozz/src/features/chat/domain/usecases/fetch_chat.dart';

class LoadChatParams extends Equatable {
  final int chatId;

  const LoadChatParams(this.chatId);

  @override
  List<Object?> get props => [];
}

class Chat extends Equatable {
  final ChatEntity chat;

  const Chat({
    required this.chat,
  });

  @override
  List<Object?> get props => [
        chat,
      ];
}

class ChatCubit extends DataCubit<Chat, LoadChatParams> {
  final FetchChat fetchChat;

  ChatCubit({
    required this.fetchChat,
  });

  @override
  bool canLazyLoad(LoadedState<Chat> state) {
    return false;
  }

  @override
  Future<Either<Failure, dynamic>> fetch(
    LoadChatParams params,
    LoadedState<Chat>? oldState,
  ) {
    return fetchChat(
      FetchChatParams(params.chatId),
    );
  }

  @override
  Future<DataState<Chat>> getLoadedState(
    LoadChatParams params,
    LoadedState<Chat>? oldState,
    data,
  ) async {
    return LoadedState(
      params: params,
      result: Chat(
        chat: data,
      ),
    );
  }
}
