import 'package:flutter/material.dart';
import 'package:flutter_movies/models/movie.dart';

import '../style.dart';
import 'movie_tag.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard({this.movie});

  Widget _buildMoviePoster() {
    return Container(
      height: Style.space * 45,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(movie.posterImg),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildMovieInfo(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          left: Style.space,
          bottom: Style.space,
          top: Style.space * 2,
        ),
        color: Theme.of(context).primaryColor.withOpacity(0.7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.title,
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: Style.space),
            Text(
              movie.year,
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: Style.space),
            MovieTypeTag(
              text: movie.type,
              color: Theme.of(context).accentColor,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(Style.space * 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            offset: Offset(4, 4),
          ),
        ],
      ),
      margin: EdgeInsets.all(Style.space),
      child: Stack(
        children: [
          _buildMoviePoster(),
          // linear gradient inner shadow (but not showing effect)
          // Container(decoration: movieCardBoxDecoration),
          _buildMovieInfo(context)
        ],
      ),
    );
  }
}
