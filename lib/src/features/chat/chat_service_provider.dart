import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mozz/src/common/service_provider.dart';
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
    // TODO: implement registerBlocs
  }

  @override
  void registerDataSources() {
    // TODO: implement registerDataSources
  }

  @override
  void registerRepositories() {
    // TODO: implement registerRepositories
  }

  @override
  void registerUseCases() {
    // TODO: implement registerUseCases
  }
}
