import 'package:flutter/material.dart';

// spacing constant
const double space = 10;

// colors
const primaryBg = Color(0xFF2c2f33);
const secondaryBg = Color(0xFF23272a);
const iconColor = Color(0xFF99aab5);
const textColor = Color(0xFFffffff);
const hintTextColor = Color(0xFFBAB9B9);
const btnPrimaryColor = Color(0xFF7289da);
const green = Color(0xFF73DA22);

// fonts
const logoFont = 'PorterSansBlock';
const headlineFont = 'Montserrat';
const btnFont = 'Montserrat';
const bodyFont = 'Nunito';

// text field decoration
final textFieldBoxDecoration = BoxDecoration(
  color: secondaryBg,
  borderRadius: BorderRadius.circular(space * 3),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

// movie card box decoration
final movieCardBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color(0xFF151C26).withOpacity(0.1),
      Color(0xFF151C26).withOpacity(0.0),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [
      0.0,
      0.9,
    ],
  ),
);
