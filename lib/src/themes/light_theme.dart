import 'package:flutter/material.dart';

ThemeData lightTheme() => ThemeData.from(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.green,
        accentColor: Colors.green,
        backgroundColor: Colors.white,
      ),
    ).copyWith(
      highlightColor: Colors.transparent,
      splashColor: Colors.green.shade50,

      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: Color(0xFF2B333E),
          fontWeight: FontWeight.w600,
          fontSize: 32,
        ),
      ),
    );
