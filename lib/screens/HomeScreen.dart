import 'package:flutter/material.dart';
import 'package:flutter_movies/shared/shared.dart';
import 'package:flutter_movies/style.dart';
import 'package:flutter_movies/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: CustomAppBar(),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: Style.paddingSymmetric(horizontal: 1, vertical: 1),
            child: MovieSimpleListView(),
          ),
          bottomNavigationBar: AppBottomNav(),
        ),
      ),
    );
  }
}
