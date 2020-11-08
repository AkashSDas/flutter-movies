import 'package:flutter/material.dart';
import 'package:flutter_movies/models/models.dart';

class MovieService extends ChangeNotifier {
  List<Movie> movies;
  String error;
  String notFoundMsg;
  bool displayLoader;

  MovieService({this.movies, this.error, this.notFoundMsg, this.displayLoader});

  void getMovieData(List<Movie> movies, String error, String notFoundMsg) {
    this.movies = movies;
    this.error = error;
    this.notFoundMsg = notFoundMsg;
    this.displayLoader = false;
    notifyListeners();
  }

  void setDisplayLoader(bool display) {
    this.displayLoader = true;
    notifyListeners();
  }
}
