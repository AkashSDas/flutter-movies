import 'package:flutter/material.dart';
import 'package:flutter_movies/constants.dart' as Constants;
import 'package:flutter_movies/screens/home_screen/controller.dart';
import 'package:flutter_movies/screens/home_screen/logo.dart';
import 'package:flutter_movies/screens/home_screen/search_form.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController _homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: Constants.space,
          vertical: Constants.space,
        ),
        color: Constants.primaryBg,
        child: SafeArea(
          child: ListView(
            children: [
              Logo(context),
              SearchForm(),
            ],
          ),
        ),
      ),
    );
  }
}
