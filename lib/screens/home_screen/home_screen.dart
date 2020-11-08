import 'package:flutter/material.dart';
import 'package:flutter_movies/constants.dart' as Constants;
import 'package:flutter_movies/screens/home_screen/logo.dart';
import 'package:flutter_movies/screens/home_screen/search_form.dart';
import 'package:flutter_movies/services/services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // =======================
  // Widgets
  // =======================
  Widget _buildMoviesProvider() {
    return ChangeNotifierProvider(
      create: (context) => MovieService(
        movies: [],
        error: '',
        notFoundMsg: '',
      ),
      child: Column(
        children: [
          SearchForm(),
          Consumer<MovieService>(
            builder: (context, data, child) {
              if (data.movies != null) {
                return Text(data.movies[0].title);
              }
              return Text('No movies');
            },
          ),
        ],
      ),
    );
  }

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
              _buildMoviesProvider(),
            ],
          ),
        ),
      ),
    );
  }
}
