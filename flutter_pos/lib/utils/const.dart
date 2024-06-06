import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF0057DA);
const Color primaryLightColor = Color.fromARGB(255, 104, 164, 255);
const Color gray100Color = Color(0xFFF5F5F5);
const Color whiteColor = Color(0xFFFFFFFF);
const Color borderColor = Color(0xFFE0E0E0);
const Color textPlaceholderColor = Color.fromARGB(218, 84, 140, 192);
const Color primaryUltraLightColor = Color(0xFFF0F5FF);
const Color iconGrayColor = Color(0xFFAAAAAA);
TextStyle bodyText(Color? color) {
  return TextStyle(
    fontFamily: 'Roboto',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: color,
  );
}

TextStyle h6(Color? color) {
  return TextStyle(
    fontFamily: 'Roboto',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: color,
  );
}

MaterialColor getMaterialColor(Color color) {
  final Map<int, Color> shades = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };
  return MaterialColor(color.value, shades);
}
