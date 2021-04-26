import 'package:flutter/material.dart';

class Style {
  /// spacing constant
  static const double space = 10;

  /// colors
  static const Color primaryColor = Color(0xFF1B1B1B);
  static const Color accentColor = Color(0xFFFF8A00);

  /// fonts
  static const fontHead = 'OpenSans';
  static const fontBody = 'SourceCodePro';

  /// theme data
  static final ThemeData themeData = ThemeData(
    primaryColor: primaryColor,
  );
}
