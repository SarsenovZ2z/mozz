import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mozz/src/features/chat/domain/entities/chat_entity.dart';
import 'package:mozz/src/features/chat/domain/entities/message_entity.dart';
import 'package:mozz/src/features/chat/presentation/widgets/chat_image.dart';

class ChatListItem extends StatelessWidget {
  final ChatEntity chat;

  const ChatListItem({
    super.key,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: ListTile(
        dense: true,
        onTap: () {
          context.pushNamed(
            'chat',
            pathParameters: {
              'id': chat.id.toString(),
            },
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        horizontalTitleGap: 12,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        leading: ChatImage(
          chatId: chat.id,
        ),
        title: _Title(
          chatName: chat.name,
        ),
        subtitle: chat.lastMessage != null
            ? _Subtitle(
                message: chat.lastMessage!,
              )
            : null,
        trailing: chat.lastMessage != null ? _ChatTimestamps(
          date: chat.lastMessage!.createdAt,
        ) : null,
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String chatName;

  const _Title({
    super.key,
    required this.chatName,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      chatName,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _Subtitle extends StatelessWidget {
  final MessageEntity message;

  const _Subtitle({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        children: [
          if (message.isSentByUser)
            TextSpan(
              text: 'Вы: ',
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
          TextSpan(
            text: message.message,
            style: TextStyle(color: Theme.of(context).colorScheme.onTertiary),
          ),
        ],
      ),
    );
  }
}

class _ChatTimestamps extends StatelessWidget {
  final DateTime date;

  const _ChatTimestamps({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          DateFormat('dd MMM HH:mm').format(date),
          style: TextStyle(
            color: Theme.of(context).hintColor,
          ),
        ),
      ],
    );
  }
}
