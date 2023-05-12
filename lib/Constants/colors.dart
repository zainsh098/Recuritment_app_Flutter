import 'package:flutter/material.dart';


Color Blue = const Color(0xff3347FF);
Color BlueTint = const Color(0xffDEE1FF);
Color Grey = const Color(0xffDFE2E9);
Color GreyLite = const Color(0xfff6F8FC);
Color Dark1 = const Color(0xff353840);
Color Dark2 = const Color(0xff444653);
Color Blue1 = const Color(0xff3855FB);

Gradient gradientColor=const LinearGradient(
    colors: [
      Color(0xff3855FB),
      Color(0xff3855fb)
    ],
    stops: [0.0, 1.0],
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
    tileMode: TileMode.repeated
);