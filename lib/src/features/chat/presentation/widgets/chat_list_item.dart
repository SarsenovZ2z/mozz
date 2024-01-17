import 'package:flutter/material.dart';

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
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        horizontalTitleGap: 12,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        leading: const _ChatImage(),
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

class _ChatImage extends StatelessWidget {
  static const gradientColors = [
    [
      Color(0xFF1FDB5F),
      Color(0xFF31C764),
    ],
    [
      Color(0xFFF66700),
      Color(0xFFED3900),
    ],
    [
      Color(0xFF00ACF6),
      Color(0xFF006DED),
    ],
  ];

  const _ChatImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: gradientColors[0],
        ),
      ),
      child: Text(
        'BB',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Theme.of(context).colorScheme.background,
        ),
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