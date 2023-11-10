import 'package:flutter/material.dart';

class AppTheme {
  static final ColorScheme colors = ColorScheme.fromSeed(seedColor: Colors.deepPurple);

  static final ThemeData current = ThemeData(
    colorScheme: colors,
    useMaterial3: true,
  );
}