import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_movies/constants.dart' as Constants;
import 'package:flutter_movies/models/models.dart';
import 'package:flutter_movies/screens/home_screen/controller.dart';

class SearchForm extends StatefulWidget {
  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  HomeController _homeController = HomeController();
  TextEditingController _textEditingController = TextEditingController();
  String movieName; // movie or tv show

  // ===================
  // Functionalities
  // ===================
  void _handleMovieNameChanges() {
    movieName = _textEditingController.text;
  }

  // ===================
  // Widgets
  // ===================
  Widget _submitBtn() {
    return IconButton(
      onPressed: () async {
        MovieResponse movieResponse = await _homeController.fetchMovies(
          movieName,
        );
        print(movieResponse.movies.map((m) => print(m.title)));
      },
      icon: Icon(
        AntDesign.search1,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }

  Widget _buildMovieNameTextField() {
    return Container(
      decoration: Constants.textFieldBoxDecoration,
      child: TextField(
        keyboardType: TextInputType.text,
        controller: _textEditingController,
        onChanged: (value) => _handleMovieNameChanges(),
        style: Theme.of(context).textTheme.bodyText1,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: Constants.space,
            vertical: Constants.space,
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
      margin: EdgeInsets.symmetric(vertical: Constants.space * 2),
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
