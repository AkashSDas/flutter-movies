import 'package:flutter/material.dart';
import 'package:flutter_movies/models/movie.dart';

class MovieResponse extends ChangeNotifier {
  List<Movie> movies;
  String error;
  String notFoundMsg;

  MovieResponse({this.movies, this.error, this.notFoundMsg});

  MovieResponse.fromJson(Map<String, dynamic> json) {
    if (json['Response'] == 'False') {
      // print(json); // { Response: 'False', Error: 'Movie not found!' }
      this.notFoundMsg = 'Movie not found';
      this.movies = [];
      this.error = '';
    } else {
      // json['Response'] == 'True'
      // print(json);
      this.movies =
          (json['Search'] as List).map((m) => Movie.fromJson(m)).toList();
      this.error = '';
      this.notFoundMsg = '';
    }

    notifyListeners();
  }

  MovieResponse.withError(String errorValue) {
    this.movies = [];
    this.error = errorValue;
    this.notFoundMsg = '';

    notifyListeners();
  }
}
