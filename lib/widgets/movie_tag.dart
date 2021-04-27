import 'package:flutter/material.dart';

import '../style.dart';

class MovieTypeTag extends StatelessWidget {
  final Color color;
  final String text;

  MovieTypeTag({this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        color: this.color,
        child: Padding(
          padding: EdgeInsets.all(Style.space * 0.8),
          child: Text(
            this.text,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}
