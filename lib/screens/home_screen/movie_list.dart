import 'package:flutter/material.dart';
import 'package:flutter_movies/constants.dart';
import 'package:flutter_movies/models/models.dart';
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
        return Container(
          decoration: textFieldBoxDecoration,
          margin: EdgeInsets.all(space),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(space * 3),
                child: Container(
                  height: space * 45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(movies[index].posterImg),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(decoration: movieCardBoxDecoration),
              Positioned(
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
                          movies[index].title,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(height: space),
                        Text(
                          movies[index].year,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(height: space),
                        MovieTypeTag(
                          text: movies[index].type,
                          color: btnPrimaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
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
