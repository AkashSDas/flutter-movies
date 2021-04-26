import 'package:flutter_movies/models/movie.dart';

class MovieResponse {
  List<Movie> movies;
  String error;
  String notFoundMessage;

  MovieResponse({this.movies, this.error, this.notFoundMessage});

  MovieResponse.fromJson(Map<String, dynamic> data) {
    if (data['Response'] == 'False') {
      // print(data); // { Response: 'False', Error: 'Movie not found!' }
      this.notFoundMessage = 'Movie not found!';
      this.movies = [];
      this.error = '';
    } else {
      // data['Response'] == 'True'
      // print(data)
      this.movies =
          (data['Search'] as List).map((m) => Movie.fromJson(m)).toList();
      this.error = '';
      this.notFoundMessage = '';
    }
  }

  MovieResponse.withError(String errorValue) {
    this.movies = [];
    this.error = errorValue;
    this.notFoundMessage = '';
  }
}
