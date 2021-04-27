import 'package:flutter/material.dart';
import 'package:flutter_movies/controllers/home_controller.dart';
import 'package:flutter_movies/models/movie_response.dart';
import 'package:flutter_movies/shared/loader.dart';

class MovieSimpleListView extends StatefulWidget {
  @override
  _MovieSimpleListViewState createState() => _MovieSimpleListViewState();
}

class _MovieSimpleListViewState extends State<MovieSimpleListView> {
  final PageController ctrl = PageController(viewportFraction: 0.8);
  int currentPage = 0;

  @override
  void initState() {
    // set state when page changes
    ctrl.addListener(() {
      int next = ctrl.page.round();

      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HomeController().fetchMovies("hero"),
      builder: (context, AsyncSnapshot<MovieResponse> snap) {
        if (!snap.hasData) return Loader();
        if (snap.data.error != '')
          return Center(
            child: Text(
              snap.data.error,
              style: Theme.of(context).textTheme.headline2,
            ),
          );
        if (snap.data.notFoundMessage != '')
          return Center(
            child: Text(
              snap.data.notFoundMessage,
              style: Theme.of(context).textTheme.headline2,
            ),
          );
        if (snap.data.movies != null)
          return PageView.builder(
            controller: ctrl,
            itemCount: snap.data.movies.length,
            itemBuilder: (context, int currentIdx) {
              bool active = currentIdx == currentPage;
              double relativePosition = (currentIdx - currentPage).toDouble();

              // Animated Properties
              final double blur = active ? 30 : 0;
              final double offset = active ? 20 : 0;
              final double top = active ? 20 : 180;

              Animation<double> rotateAnimation =
                  AlwaysStoppedAnimation(0 / 360);
              if (relativePosition < 0) {
                // Left side
                rotateAnimation = AlwaysStoppedAnimation(-5 / 360);
              } else if (relativePosition > 0) {
                // Right side
                rotateAnimation = AlwaysStoppedAnimation(5 / 360);
              }

              return RotationTransition(
                turns: rotateAnimation,
                child: AnimatedContainer(
                  margin: EdgeInsets.only(
                    top: top,
                    bottom: 80,
                    right: 25,
                    left: 25,
                  ),
                  curve: Curves.easeOutQuint,
                  duration: Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        snap.data.movies[currentIdx].posterImg,
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        blurRadius: blur,
                        offset: Offset(offset, offset),
                      )
                    ],
                  ),
                ),
              );
            },
          );

        return Container();
      },
    );
  }
}
