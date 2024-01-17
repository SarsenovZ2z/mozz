import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mozz/src/common/presentation/widgets/ui/back_arrow.dart';
import 'package:mozz/src/features/chat/domain/entities/message_entity.dart';
import 'package:mozz/src/features/chat/presentation/widgets/chat_image.dart';
import 'package:mozz/src/utils/extensions/iterable/group_by.dart';

class ChatScreen extends StatelessWidget {
  final String chatId;

  const ChatScreen({
    super.key,
    required this.chatId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 36,
        leading: const BackArrow(),
        title: const _Title(),
        toolbarHeight: 74,
      ),
      body: const _Content(),
      bottomSheet: const _Bottom(),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ChatImage(),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Victor Vlasov',
              style: TextStyle(
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
    final List<MessageEntity> messages = [
      MessageEntity(
        id: 3,
        message: 'Уже сделал?',
        isSentByUser: true,
        createdAt: DateTime.parse('2022-01-23 21:43:00'),
        readAt: null,
      ),
      MessageEntity(
        id: 2,
        message: 'Okay',
        isSentByUser: false,
        createdAt: DateTime.parse('2022-01-22 21:42:00'),
        readAt: null,
      ),
      MessageEntity(
        id: 1,
        message: 'Сделай мне кофе, пожалуйста',
        isSentByUser: true,
        createdAt: DateTime.parse('2022-01-22 21:41:00'),
        readAt: null,
      ),
    ];

    final grouped = messages.groupBy<String>(
      (message) => DateFormat('dd.MM.yy').format(message.createdAt),
    );

    return ListView(
      reverse: true,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      children: [
        const SizedBox(height: 100),
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
    return const SafeArea(
      child: Text('bottom'),
    );
  }
}
