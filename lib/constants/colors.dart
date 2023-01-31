import 'package:flutter/material.dart';
import 'package:inter_coffee/main.dart';

Color arrowWhite = const Color(0xffe7e7e7);
Color green = const Color(0xff4CAF50);
Color white = const Color(0xffcdcdcd);
Color checkColor = const Color(0xfffafafa);
Color tableBlack = const Color.fromRGBO(48, 48, 48, 0.8);
Color borderWhite = const Color.fromRGBO(182, 182, 182, 1);
Color greyBG = const Color.fromRGBO(160, 160, 160, 0.26);
Color orderDetailsGreen = const Color.fromRGBO(76, 175, 80, 1);
Color pending = const Color.fromRGBO(255, 138, 0, 1);
Color cancelled = const Color.fromRGBO(255, 0, 46, 1);

List<Color> glassShadeFirst3Screen = isAdmin 
  ? const [
      Color.fromRGBO(255, 255, 255, 0.47),
      Color.fromRGBO(255, 255, 255, 0.12),
      Color.fromRGBO(255, 255, 255, 0.54),
      // Color.fromRGBO(255, 255, 255, 0.83),
      // Color.fromRGBO(255, 255, 255, 0.14),
      // Color.fromRGBO(255, 255, 255, 0.38),
      // Color.fromRGBO(255, 255, 255, 0.77)
    ]
    : const [
          Color.fromARGB(38, 255, 255, 255)
        ];

List<Color> backgroundFirst3Screen = isAdmin 
  ? const [
      Color.fromRGBO(0, 0, 0, 0), 
      Color.fromRGBO(60, 30, 14, 0.79)
    ]
    : const [
          Color.fromRGBO(80, 114, 235, 0),
          Color.fromRGBO(80, 114, 235, 0),
          Color.fromRGBO(80, 114, 235, 0),
          Color.fromRGBO(207, 123, 75, 0.51)
        ];

List<Color> page2BGgradient = isAdmin 
  ? const [Color.fromRGBO(125, 80, 57, 0.6),Color.fromRGBO(125, 80, 57, 0.6)]
    : const [Colors.transparent, Color.fromARGB(50, 207, 123, 75)];

List<Color> searchBarBG = const [
              Color.fromRGBO(255, 255, 255, 0.38),
              Color.fromRGBO(255, 255, 255, 0.14),
              Color.fromRGBO(255, 255, 255, 0.05)
            ];

Color nameBar = isAdmin ? Color.fromRGBO(255, 255, 255, 1) : Colors.transparent;

Color userPageMainBG = isAdmin ? const Color.fromRGBO(125, 80, 57, 0.6) : Colors.transparent;

Color nameAndDateInNameBar = isAdmin ? Color.fromRGBO(58, 23, 23, 1) : Color.fromARGB(255, 182, 182, 182);