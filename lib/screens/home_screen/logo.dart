import 'package:flutter/material.dart';
import 'package:flutter_movies/constants.dart' as Constants;

Widget Logo(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: Constants.space,
      vertical: Constants.space * 2,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Flutter', style: Theme.of(context).textTheme.headline1),
        SizedBox(height: Constants.space),
        Text('Movies', style: Theme.of(context).textTheme.headline1),
      ],
    ),
  );
}
