import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mozz/src/features/chat/presentation/widgets/chats_sliver_list.dart';
import 'package:mozz/src/features/chat/presentation/widgets/search_chats.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: const Text('Чаты'),
          backgroundColor: Theme.of(context).colorScheme.background,
          border: null,
        ),
        const SliverToBoxAdapter(
          child: SearchChats(),
        ),
        const SliverPadding(
          padding: EdgeInsets.all(8),
          sliver: ChatsSliverList(),
        ),
      ],
    );
  }
}
