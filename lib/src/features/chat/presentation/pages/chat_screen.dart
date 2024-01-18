import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mozz/src/common/presentation/controllers/data_states.dart';
import 'package:mozz/src/common/presentation/widgets/ui/back_arrow.dart';
import 'package:mozz/src/features/chat/domain/entities/chat_entity.dart';
import 'package:mozz/src/features/chat/domain/entities/message_entity.dart';
import 'package:mozz/src/features/chat/presentation/controllers/chat_cubit.dart';
import 'package:mozz/src/features/chat/presentation/controllers/chat_messages_cubit.dart';
import 'package:mozz/src/features/chat/presentation/widgets/chat_image.dart';
import 'package:mozz/src/utils/extensions/iterable/group_by.dart';

class ChatScreen extends StatelessWidget {
  final int chatId;

  const ChatScreen({
    super.key,
    required this.chatId,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatCubit>(
          create: (_) => GetIt.instance()..load(LoadChatParams(chatId)),
        ),
        BlocProvider<ChatMessagesCubit>(
          create: (_) => GetIt.instance()..load(LoadChatMessages(chatId)),
        ),
      ],
      child: BlocBuilder<ChatCubit, DataState<Chat>>(builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is! LoadedState<Chat>) {
          // TODO: show error
          return const SizedBox();
        }

        return Scaffold(
          appBar: AppBar(
            leadingWidth: 36,
            leading: const BackArrow(),
            title: _Title(
              chat: state.result.chat,
            ),
            toolbarHeight: 74,
          ),
          body: const _Content(),
          bottomSheet: const _Bottom(),
        );
      }),
    );
  }
}

class _Title extends StatelessWidget {
  final ChatEntity chat;

  const _Title({
    super.key,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ChatImage(
          chatId: chat.id,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              chat.name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'online',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onTertiary,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatMessagesCubit, DataState<ChatMessages>>(
        builder: (context, state) {
      if (state is LoadingState) {
        // TODO: use Shimmer
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is! LoadedState<ChatMessages>) {
        return const SizedBox();
      }

      final grouped = state.result.messages.groupBy<String>(
        (message) => DateFormat('dd.MM.yy').format(message.createdAt),
      );

      return ListView(
        reverse: true,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        children: [
          const SizedBox(height: 140),
          for (final group in grouped.entries) ...[
            ...group.value.map(
              (message) => _MessageContainer(
                message: message,
              ),
            ),
            _MessageGroup(
              groupName: group.key,
            ),
          ],
        ],
      );
    });
  }
}

class _MessageGroup extends StatelessWidget {
  final String groupName;

  const _MessageGroup({
    super.key,
    required this.groupName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 2,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            groupName,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onTertiary,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Divider(
              thickness: 2,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageContainer extends StatelessWidget {
  final MessageEntity message;

  const _MessageContainer({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: message.isSentByUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!message.isSentByUser)
            SvgPicture.asset(
              'assets/icons/message-left-border.svg',
              width: 10,
              height: 21,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.tertiary,
                BlendMode.srcIn,
              ),
            ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              color: message.isSentByUser
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft: Radius.circular(message.isSentByUser ? 16 : 0),
                bottomRight: Radius.circular(message.isSentByUser ? 0 : 16),
              ),
            ),
            child: Row(
              children: [
                _Message(message: message),
                _MessageInfo(message: message),
              ],
            ),
          ),
          if (message.isSentByUser)
            SvgPicture.asset(
              'assets/icons/message-right-border.svg',
              width: 10,
              height: 21,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.primaryContainer,
                  BlendMode.srcIn),
            ),
        ],
      ),
    );
  }
}

class _Message extends StatelessWidget {
  final MessageEntity message;

  const _Message({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      message.message,
      style: TextStyle(
        color: message.isSentByUser
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.onBackground,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _MessageInfo extends StatelessWidget {
  final MessageEntity message;

  const _MessageInfo({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7),
      child: Transform.translate(
        offset: const Offset(0, 6),
        child: Row(
          children: [
            Text(
              DateFormat('HH:mm').format(message.createdAt),
              style: TextStyle(
                color: message.isSentByUser
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onBackground,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 14,
        bottom: 44,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        border: Border(
          top: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _Attach(),
          SizedBox(width: 8),
          _TextInput(),
          SizedBox(width: 8),
          _Microphone(),
        ],
      ),
    );
  }
}

class _Attach extends StatelessWidget {
  const _Attach({super.key});

  @override
  Widget build(BuildContext context) {
    return _ChatButton(
      onPressed: () {},
      icon: 'assets/icons/attach.svg',
    );
    ;
  }
}

class _Microphone extends StatelessWidget {
  const _Microphone({super.key});

  @override
  Widget build(BuildContext context) {
    return _ChatButton(
      onPressed: () {},
      icon: 'assets/icons/micro.svg',
    );
  }
}

class _ChatButton extends StatelessWidget {
  final void Function() onPressed;
  final String icon;

  const _ChatButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(Theme.of(context).colorScheme.tertiary),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      icon: SvgPicture.asset(icon),
    );
  }
}

class _TextInput extends StatefulWidget {
  const _TextInput({super.key});

  @override
  State<_TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<_TextInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: _controller,
        onFieldSubmitted: (String text) {
          print("sending message: $text");
          _controller.clear();
        },
        decoration: const InputDecoration(
          hintText: 'Сообщение',
        ),
      ),
    );
  }
}
