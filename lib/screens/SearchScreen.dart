import 'package:flutter/material.dart';
import 'package:flutter_movies/services/movie_service.dart';
import 'package:flutter_movies/shared/app_bar.dart';
import 'package:flutter_movies/shared/bottom_nav.dart';
import 'package:flutter_movies/widgets/movie_list.dart';
import 'package:flutter_movies/widgets/search_form.dart';
import 'package:provider/provider.dart';

import '../style.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Widget _buildMoviesProvider() {
    return ChangeNotifierProvider(
      create: (context) => MovieService(),
      child: Column(
        children: [
          SearchForm(),
          Consumer<MovieService>(
            builder: (context, data, child) {
              if (data.movies != null) {
                return MovieList();
              }
              return Text(
                'Find movies from a wide range of collection',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: CustomAppBar(),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: Style.paddingSymmetric(horizontal: 1, vertical: 1),
            child: ListView(children: [_buildMoviesProvider()]),
          ),
          bottomNavigationBar: AppBottomNav(2),
        ),
      ),
    );
  }
}
