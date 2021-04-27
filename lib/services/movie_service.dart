import 'package:flutter/material.dart';
import 'package:flutter_movies/models/movie.dart';

/// MovieService will responsible for movies states
/// in the app
class MovieService extends ChangeNotifier {
  List<Movie> movies;
  String error;
  String notFoundMessage;
  bool displayLoader;

  MovieService({
    this.movies,
    this.error,
    this.notFoundMessage,
    this.displayLoader,
  });

  /// Notify all the listeners with new movies data
  void getMoviesData(List<Movie> movies, String error, String notFoundMessage) {
    this.movies = movies;
    this.error = error;
    this.notFoundMessage = notFoundMessage;
    this.displayLoader = false;
    notifyListeners();
  }

  /// Set display loader with notifying the listeners
  void setDisplayLoader(bool display) {
    this.displayLoader = display;
    notifyListeners();
  }
}
