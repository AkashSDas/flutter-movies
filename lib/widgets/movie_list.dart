import 'package:flutter/material.dart';
import 'package:flutter_movies/models/movie.dart';
import 'package:flutter_movies/services/movie_service.dart';
import 'package:flutter_movies/shared/loader.dart';
import 'package:provider/provider.dart';

import 'movie_card.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  // is used if movie is not found or encounter some error
  Widget _buildMessageText(String msg) {
    return Text(
      msg,
      style: Theme.of(context).textTheme.headline2,
    );
  }

  Widget _buildMoviesListView(List<Movie> movies) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return MovieCard(movie: movies[index]);
      },
    );
  }

  Widget _buildSearchResults(MovieService data) {
    if (data.notFoundMessage != '') {
      return _buildMessageText(data.notFoundMessage);
    } else if (data.error != '') {
      return _buildMessageText(data.error);
    }
    return _buildMoviesListView(data.movies);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieService>(
      builder: (context, data, child) {
        if (data.displayLoader) {
          return Loader();
        }
        return _buildSearchResults(data);
      },
    );
  }
}
