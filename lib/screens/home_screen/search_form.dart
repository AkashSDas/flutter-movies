import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_movies/constants.dart' as Constants;

class SearchForm extends StatefulWidget {
  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
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
          suffixIcon: Icon(AntDesign.search1),
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
