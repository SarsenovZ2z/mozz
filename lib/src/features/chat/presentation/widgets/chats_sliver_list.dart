import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mozz/src/common/presentation/controllers/data_states.dart';
import 'package:mozz/src/features/chat/presentation/controllers/chats_cubit.dart';
import 'package:mozz/src/features/chat/presentation/widgets/chat_list_item.dart';

class ChatsSliverList extends StatelessWidget {
  const ChatsSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, DataState<Chats>>(builder: (context, state) {
      if (state is LoadingState) {
        return const SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      if (state is! LoadedState<Chats>) {
        return const SliverToBoxAdapter(
          child: SizedBox(),
        );
      }

      return SliverList.builder(
        itemCount: state.result.chats.length,
        itemBuilder: (context, index) => ChatListItem(
          chat: state.result.chats[index],
        ),
      );
    });
  }
}
