import 'package:flutter/material.dart';
import 'package:flutter_movies/style.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(Style.space),
        width: Style.space * 30,
        height: Style.space * 30,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: Style.space * 30,
            height: Style.space * 30,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Style.orange),
              strokeWidth: 8,
            ),
          ),
        ),
      ),
    );
  }
}
