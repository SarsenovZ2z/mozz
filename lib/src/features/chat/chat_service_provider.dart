import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mozz/src/common/service_provider.dart';
import 'package:mozz/src/features/chat/data/datasources/chat_datasource.dart';
import 'package:mozz/src/features/chat/data/datasources/chat_memory_datasource.dart';
import 'package:mozz/src/features/chat/data/repositories/chat_repository.dart';
import 'package:mozz/src/features/chat/domain/repositories/chat_repository.dart';
import 'package:mozz/src/features/chat/domain/usecases/fetch_chats.dart';
import 'package:mozz/src/features/chat/domain/usecases/fetch_messages.dart';
import 'package:mozz/src/features/chat/presentation/controllers/chats_cubit.dart';
import 'package:mozz/src/features/chat/presentation/pages/chat_screen.dart';

class ChatServiceProvider extends ServiceProvider {
  const ChatServiceProvider();

  @override
  List getRoutes() {
    return [
      GoRoute(
        path: '/chat/:id',
        name: 'chat',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: ChatScreen(
            key: state.pageKey,
            chatId: state.pathParameters['id']!,
          ),
        ),
      ),
    ];
  }

  @override
  void registerBlocs() {
    GetIt.instance.registerFactory<ChatsCubit>(
      () => ChatsCubit(
        fetchChats: GetIt.instance(),
      ),
    );
  }

  @override
  void registerDataSources() {
    GetIt.instance.registerFactory<ChatDataSource>(
      () => ChatMemoryDataSource(),
    );
  }

  @override
  void registerRepositories() {
    GetIt.instance.registerLazySingleton<ChatRepository>(
      () => ChatRepositoryImpl(
        chatDataSource: GetIt.instance(),
      ),
    );
  }

  @override
  void registerUseCases() {
    GetIt.instance.registerFactory<FetchChats>(
      () => FetchChats(
        chatRepository: GetIt.instance(),
      ),
    );

    GetIt.instance.registerFactory<FetchMessages>(
      () => FetchMessages(
        chatRepository: GetIt.instance(),
      ),
    );
  }
}
