import 'package:flutter/material.dart';


ColorScheme lightTheme() => ColorScheme.fromSwatch(
  primarySwatch: Colors.green,
).copyWith(
  primaryContainer: const Color(0xFF3CED78),
  onPrimary: const Color(0xFF00521C),
  tertiary: const Color(0xFFEDF2F6),
  onTertiary: const Color(0xFF5E7A90),
  background: Colors.white,
  onBackground: const Color(0xFF2B333E),
  outline: const Color(0xFFEDF2F6),
);