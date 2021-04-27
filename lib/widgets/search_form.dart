import 'package:flutter/material.dart';
import 'package:flutter_movies/controllers/home_controller.dart';
import 'package:flutter_movies/models/movie_response.dart';
import 'package:flutter_movies/services/movie_service.dart';
import 'package:flutter_movies/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SearchForm extends StatefulWidget {
  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  HomeController _homeCtrl = HomeController();
  TextEditingController _textEditingCtrl = TextEditingController();
  String movieNameToSearch;

  void _handleMovieNameChanges() {
    movieNameToSearch = _textEditingCtrl.text;
  }

  Widget _submitBtn() {
    MovieService _movieService = Provider.of<MovieService>(context);

    return IconButton(
      onPressed: () async {
        _movieService.setDisplayLoader(true);

        MovieResponse movieResponse = await _homeCtrl.fetchMovies(
          movieNameToSearch,
        );

        // displayLoader will get to false using getMoviesData
        _movieService.getMoviesData(
          movieResponse.movies,
          movieResponse.error,
          movieResponse.notFoundMessage,
        );
      },
      icon: Icon(
        FontAwesomeIcons.search,
        color: Theme.of(context).textTheme.bodyText1.color,
      ),
    );
  }

  Widget _buildMovieNameTextField() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(Style.space * 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        controller: _textEditingCtrl,
        onChanged: (value) => _handleMovieNameChanges(),
        style: Theme.of(context).textTheme.bodyText1,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: Style.space,
            vertical: Style.space,
          ),
          suffixIcon: _submitBtn(),
          hintText: 'Search movies',
          hintStyle: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Style.space * 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMovieNameTextField(),
        ],
      ),
    );
  }
}
