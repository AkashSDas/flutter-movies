import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movies/screens/screens.dart';

import './constants.dart' as Constants;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext contex) {
    // changing statusbar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));

    return MaterialApp(
      title: 'Flutter Movies',
      debugShowCheckedModeBanner: false,

      // Routes
      routes: {
        '/': (BuildContext context) => HomeScreen(),
      },

      // Theme
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Constants.iconColor,
          size: 16,
        ),
        primaryColor: Constants.primaryBg,
        accentColor: Constants.secondaryBg,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 28,
            color: Constants.green,
            fontFamily: Constants.logoFont,
            fontWeight: FontWeight.w800,
          ),
          headline2: TextStyle(
            fontSize: 18,
            color: Constants.textColor,
            fontFamily: Constants.headlineFont,
            fontWeight: FontWeight.w800,
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            color: Constants.textColor,
            fontFamily: Constants.bodyFont,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
