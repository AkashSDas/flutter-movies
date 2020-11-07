import 'package:flutter_movies/models/models.dart';
import 'package:flutter_movies/repositories/repositories.dart';

class HomeController {
  final MovieRepository _movieRepository = MovieRepository();

  // get movies
  Future<MovieResponse> fetchMovies(String movieName) {
    return _movieRepository.getMovies(movieName);
  }
}
