import 'package:flutter/material.dart';
import 'package:flutter_movies/constants.dart' as Constants;

Widget Logo(String text, BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: Constants.space,
      vertical: Constants.space * 2,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(text, style: Theme.of(context).textTheme.headline1),
      ],
    ),
  );
}
