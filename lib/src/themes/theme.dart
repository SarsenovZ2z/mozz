import 'package:flutter/material.dart';

ThemeData themeData(ColorScheme theme) => ThemeData.from(
      colorScheme: theme,
    ).copyWith(
      dividerColor: theme.outline,
      splashColor: Colors.green.shade50,
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
