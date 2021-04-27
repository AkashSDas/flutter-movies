import 'package:dio/dio.dart';
import 'package:flutter_movies/models/movie_response.dart';

class MovieRepository {
  final Dio _dio = Dio();

  /// Fetch movies using name
  Future<MovieResponse> getMovies(String query) async {
    try {
      Response response = await _dio.get(
        'http://www.omdbapi.com/?s=$query&apikey=thewdb',
      );
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error, stacktrace');
      return MovieResponse.withError('$error');
    }
  }
}
