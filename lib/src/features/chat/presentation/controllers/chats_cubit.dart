import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mozz/src/common/domain/entities/failure.dart';
import 'package:mozz/src/common/presentation/controllers/data_cubit.dart';
import 'package:mozz/src/common/presentation/controllers/data_states.dart';
import 'package:mozz/src/features/chat/domain/entities/chat_entity.dart';
import 'package:mozz/src/features/chat/domain/usecases/fetch_chats.dart';

class LoadChats extends Equatable {
  const LoadChats();

  @override
  List<Object?> get props => [];
}

class Chats extends Equatable {
  final List<ChatEntity> chats;

  const Chats({
    required this.chats,
  });

  @override
  List<Object?> get props => [
        chats,
      ];
}

class ChatsCubit extends DataCubit<Chats, LoadChats> {
  final FetchChats fetchChats;

  ChatsCubit({
    required this.fetchChats,
  });

  @override
  bool canLazyLoad(LoadedState<Chats> state) {
    return false;
  }

  @override
  Future<Either<Failure, dynamic>> fetch(
    LoadChats params,
    LoadedState<Chats>? oldState,
  ) {
    return fetchChats();
  }

  @override
  Future<DataState<Chats>> getLoadedState(
    LoadChats params,
    LoadedState<Chats>? oldState,
    data,
  ) async {
    return LoadedState<Chats>(
      params: params,
      result: Chats(
        chats: data,
      ),
    );
  }
}
