// ignore_for_file: prefer_const_constructors

import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color mainClr = Colors.blueGrey;

class Themes {
  static final light =
      ThemeData(primarySwatch: Colors.blueGrey, brightness: Brightness.light);

  static final dark =
      ThemeData(primarySwatch: Colors.brown, brightness: Brightness.light);
}

TextStyle get subHeadingStyle {
  return GoogleFonts.bodoniModa(
      textStyle: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w400, color: Colors.grey));
}

TextStyle get headingStyle {
  return GoogleFonts.bodoniModa(
      textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold));
}

TextStyle get titleStyle {
  return GoogleFonts.poiretOne(
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500));
}

TextStyle get subtitleStyle {
  return GoogleFonts.vollkorn(
      textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w200, color: Colors.grey));
}
