import 'package:flutter_movies/models/models.dart';
import 'package:flutter_movies/repositories/movie_repository.dart';

class HomeController {
  final MovieRepository _movieRepository = MovieRepository();

  /// Fetch movies
  Future<MovieResponse> fetchMovies(String movieName) async {
    return _movieRepository.getMovies(movieName);
  }
}
