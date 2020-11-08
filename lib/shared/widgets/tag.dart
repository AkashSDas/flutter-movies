import 'package:flutter/material.dart';
import 'package:flutter_movies/constants.dart';

class MovieTypeTag extends StatelessWidget {
  final Color color;
  final String text;

  MovieTypeTag({this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(space * 3),
      child: Container(
        color: this.color,
        child: Padding(
          padding: EdgeInsets.all(space * 0.8),
          child: Text(
            this.text,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
