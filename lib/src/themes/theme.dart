import 'package:flutter/material.dart';

ThemeData themeData(ColorScheme theme) => ThemeData(
      brightness: Brightness.light,
      colorScheme: theme,
      fontFamily: 'Gilroy',
      dividerColor: theme.outline,
      splashColor: Colors.green.shade50,
      //
      appBarTheme: AppBarTheme(
        titleSpacing: 6,
        elevation: 0.1,
        surfaceTintColor: theme.background,
        backgroundColor: theme.background,
        shape: Border(
          bottom: BorderSide(color: theme.outline),
        ),
      ),
      //
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: theme.tertiary,
        filled: true,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: theme.onTertiary,
        ),
        contentPadding: const EdgeInsets.all(8),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
