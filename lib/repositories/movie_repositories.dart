import 'package:dio/dio.dart';
import 'package:flutter_movies/models/models.dart';

class MovieRepository {
  final Dio _dio = Dio();

  // getting movies as per movie name
  Future<MovieResponse> getMovies(String query) async {
    try {
      Response response = await _dio.get(
        'http://www.omdbapi.com/?s=$query&apikey=thewdb',
      );
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error, stacktrace: $stacktrace');
      return MovieResponse.withError('$error');
    }
  }
}
