import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movies/screens/SearchScreen.dart';
import 'package:flutter_movies/screens/screens.dart';
import 'package:flutter_movies/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      title: 'Flutter Movies',
      debugShowCheckedModeBanner: false,
      theme: Style.themeData,
      routes: {
        '/': (context) => Container(
              color: Theme.of(context).primaryColor,
              child: SafeArea(
                child: SplashScreen.navigate(
                  name: 'assets/animations/flare-splash-screen.flr',
                  next: (context) => HomeScreen(),
                  until: () => Future.delayed(Duration(seconds: 3)),
                  startAnimation: 'go',
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
        '/player': (context) => PlayerScreen(),

        /// Two entry for HomeScreen widget so that when the
        /// app initialize and we go to HomeScreen through
        /// route '/' we see the splash screen and then the other
        /// time we want to go to HomeScreen we don't see the splash
        /// screen
        '/home': (context) => HomeScreen(),

        '/search': (context) => SearchScreen(),
      },
    );
  }
}
