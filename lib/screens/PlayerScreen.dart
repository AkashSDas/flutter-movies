import 'package:flutter/material.dart';
import 'package:flutter_movies/controllers/controllers.dart';
import 'package:flutter_movies/models/models.dart';
import 'package:flutter_movies/shared/app_bar.dart';
import 'package:flutter_movies/shared/bottom_nav.dart';
import 'package:flutter_movies/shared/loader.dart';

class PlayerScreen extends StatefulWidget {
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final PageController ctrl = PageController(viewportFraction: 0.6);
  double currentPage = 0.0;

  @override
  void initState() {
    // set state when page changes
    ctrl.addListener(() {
      int next = ctrl.page.round();

      if (currentPage != next) {
        setState(() {
          currentPage = ctrl.page;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: CustomAppBar(),
          body: Column(
            children: [
              Container(
                height: 300,
                color: Theme.of(context).primaryColor,
                child: FutureBuilder(
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
                      return Container(
                        height: 350,
                        child: PageView.builder(
                          controller: ctrl,
                          itemCount: snap.data.movies.length,
                          itemBuilder: (context, int currentIdx) => AlbumCard(
                            posterImgUrl:
                                snap.data.movies[currentIdx].posterImg,
                            currentIdx: currentIdx,
                            currentPage: currentPage,
                          ),
                        ),
                      );

                    return Container();
                  },
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    GestureDetector(
                      onPanUpdate: (e) => _panHandler(e),
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              child: Text(
                                'MENU',
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              alignment: Alignment.topCenter,
                              margin: EdgeInsets.only(top: 36),
                            ),
                            Container(
                              child: IconButton(
                                icon: Icon(
                                  Icons.fast_forward,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .color,
                                ),
                                iconSize: 40,
                                onPressed: () => ctrl.animateToPage(
                                  (ctrl.page + 1).toInt(),
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOutCubic,
                                ),
                              ),
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(right: 26),
                            ),
                            Container(
                              child: IconButton(
                                icon: Icon(
                                  Icons.fast_rewind,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .color,
                                ),
                                iconSize: 40,
                                onPressed: () => ctrl.animateToPage(
                                  (ctrl.page - 1).toInt(),
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOutCubic,
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(left: 26),
                            ),
                            Container(
                              child: IconButton(
                                icon: Icon(
                                  Icons.play_arrow,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .color,
                                ),
                                iconSize: 40,
                                onPressed: () {},
                              ),
                              alignment: Alignment.bottomCenter,
                              margin: EdgeInsets.only(bottom: 26),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: AppBottomNav(1),
        ),
      ),
    );
  }

  void _panHandler(DragUpdateDetails d) {
    double radius = 150;

    /// Pan location on wheel
    bool onTop = d.localPosition.dy <= radius;
    bool onLeftSide = d.localPosition.dx <= radius;

    /// If you are on left, you cannot be on right and if you are
    /// on top,you cannot be on bottom
    bool onBottom = !onTop;
    bool onRightSide = !onLeftSide;

    /// Pan movement
    bool panUp = d.delta.dy <= 0.0;
    bool panLeft = d.delta.dx <= 0.0;
    bool panRight = !panLeft;
    bool panDown = !panUp;

    /// Absolute change on axis
    double yChange = d.delta.dy.abs();
    double xChange = d.delta.dx.abs();

    /// Direction on wheel
    double verticalRotation = (onRightSide && panDown) || (onLeftSide && panUp)
        ? yChange
        : yChange * -1;
    double horizontalRotation =
        (onTop && panRight) || (onBottom && panLeft) ? xChange : xChange * -1;

    /// Total computed change
    double velocity = d.delta.distance * 0.2; // How fast the user is moving
    double rotationalChange =
        (verticalRotation + horizontalRotation) * velocity;

    /// Move the page view scroller
    ctrl.jumpTo(ctrl.offset + rotationalChange);
  }
}

class AlbumCard extends StatelessWidget {
  final String posterImgUrl;
  final int currentIdx;
  final double currentPage;

  AlbumCard({this.posterImgUrl, this.currentIdx, this.currentPage});

  @override
  Widget build(BuildContext context) {
    double relativePosition = currentIdx - currentPage;

    return Container(
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.01)
          ..scale((1 - relativePosition.abs()).clamp(0.2, 0.6) + 0.4)
          ..rotateY(relativePosition),
        // ..rotateZ(relativePosition * 0.3),
        alignment: relativePosition >= 0
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(posterImgUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(4, 4),
                blurRadius: 20,
                color: Colors.black38,
              )
            ],
          ),
        ),
      ),
    );
  }
}
