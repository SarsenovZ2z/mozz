import 'package:flutter/material.dart';
import 'package:mozz/src/features/chat/presentation/widgets/chat_list_item.dart';
import 'package:mozz/src/features/chat/presentation/widgets/search_chats.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Чаты'),
      ),
      body: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SearchChats(),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          sliver: SliverList.builder(
            itemCount: 100,
            itemBuilder: (context, index) => const ChatListItem(),
          ),
        ),
      ],
    );
  }
}