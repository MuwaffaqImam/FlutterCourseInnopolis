import 'dart:ui';

import 'package:flutter/material.dart';

class MyColors {
  static const Color redCaramel = Color(0xFF864921);
  static const Color greenGrass = Color(0xFF4D6658);
  static const Color smoothBackground = Color(0xFFF2EEE1);
  static final Color smoothGreen = Color(0xFFFBFDF7);
}

class MyTextStyles {

  static final String eczar = "Eczar";
  static final String merriweather = "Merriweather";

  static TextStyle headline6 = TextStyle(
    color: Colors.white,
    fontFamily: eczar,
    fontSize: 20.0,
    fontWeight: FontWeight.w900,
  );
 static  TextStyle headline5 = TextStyle(
    color: Colors.red,
    fontFamily: eczar,
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
  );

  static TextStyle button = TextStyle(
    color: Colors.red,
    fontFamily: merriweather,
    fontSize: 18.0,
    fontWeight: FontWeight.w300,
  );



}