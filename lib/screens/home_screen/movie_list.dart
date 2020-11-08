import 'package:flutter/material.dart';
import 'package:flutter_movies/models/models.dart';
import 'package:flutter_movies/screens/home_screen/movie_card.dart';
import 'package:flutter_movies/services/services.dart';
import 'package:flutter_movies/shared/widgets/widgets.dart';
import 'package:provider/provider.dart';

class MoviesList extends StatefulWidget {
  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
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
    if (data.notFoundMsg != '') {
      return _buildMessageText(data.notFoundMsg);
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
