
import 'package:flutter/material.dart';

class ChatImage extends StatelessWidget {
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

  const ChatImage({super.key});

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