import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Style {
  /// spacing constant
  static const double space = 10;

  /// colors
  static const Color primaryColor = Color(0xFF1B1B1B);
  static const Color accentColor = Color(0xFF363636);

  static const Color orange = Color(0xFFFF8A00);

  static const Color textColor1 = Color(0xFFA3AEBF);

  /// fonts
  static const fontHead = 'OpenSans';
  static const fontBody = 'SourceCodePro';

  /// theme data
  static final ThemeData themeData = ThemeData(
    primaryColor: primaryColor,
    accentColor: accentColor,
    textTheme: createTextTheme(),
  );

  /// Text Theme
  static TextTheme createTextTheme() => TextTheme(
        headline1: createTextStyle(fontSize: 26, isHeadline: true),
        headline2: createTextStyle(fontSize: 22, isHeadline: true),
        bodyText1: createTextStyle(fontSize: 20),
        bodyText2: createTextStyle(fontSize: 18),
      );

  /// Text Style
  static TextStyle createTextStyle({double fontSize, bool isHeadline: false}) =>
      isHeadline
          ? TextStyle(
              fontSize: fontSize,
              color: Colors.white,
              fontFamily: fontHead,
              fontWeight: FontWeight.w700,
            )
          : TextStyle(
              fontSize: fontSize,
              color: textColor1,
              fontFamily: fontBody,
              fontWeight: FontWeight.w400,
            );

  /// Padding
  /// @params:
  ///    horizontal: this will be multiplied by Style.space
  ///    vertical: this will be multiplied by Style.space
  static EdgeInsets paddingSymmetric({double horizontal, double vertical}) =>
      EdgeInsets.symmetric(
        horizontal: space * horizontal,
        vertical: space * vertical,
      );

  /// Logo text style
  static final logoTextStyle = TextStyle(
    fontSize: 28,
    fontFamily: 'PorterSans',
    color: Style.orange,
  );
}
