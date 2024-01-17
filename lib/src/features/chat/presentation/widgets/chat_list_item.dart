import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mozz/src/features/chat/presentation/widgets/chat_image.dart';

class ChatListItem extends StatelessWidget {
  const ChatListItem({super.key});

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
              'id': '1',
            },
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        horizontalTitleGap: 12,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        leading: const ChatImage(),
        title: const _Title(),
        subtitle: const _Subtitle(),
        trailing: const _ChatTimestamps(),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Victor Vlasov',
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: 'Вы: ',
            style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
          ),
          TextSpan(
            text: 'Уже сделал?',
            style: TextStyle(color: Theme.of(context).colorScheme.onTertiary),
          ),
        ],
      ),
    );
  }
}

class _ChatTimestamps extends StatelessWidget {
  const _ChatTimestamps({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Вчера',
          style: TextStyle(
            color: Theme.of(context).hintColor,
          ),
        ),
      ],
    );
  }
}
