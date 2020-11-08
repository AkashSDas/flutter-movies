import 'package:flutter/material.dart';
import 'package:flutter_movies/constants.dart';
import 'package:flutter_movies/models/models.dart';
import 'package:flutter_movies/shared/widgets/widgets.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard({this.movie});

  Widget _buildMoviePoster() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(space * 3),
      child: Container(
        height: space * 45,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(movie.posterImg),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget _buildMovieInfo(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(space * 3),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.only(
            left: space,
            bottom: space,
            top: space,
          ),
          color: Color(0xFF151C26).withOpacity(0.7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(height: space),
              Text(
                movie.year,
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(height: space),
              MovieTypeTag(
                text: movie.type,
                color: btnPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: textFieldBoxDecoration,
      margin: EdgeInsets.all(space),
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
