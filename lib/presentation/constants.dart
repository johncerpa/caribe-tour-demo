import 'package:flutter/material.dart';

const kPrimaryColor = Colors.blue; // Blue
const kPrimaryDarkerColor = Color.fromARGB(255, 21, 101, 192); // Darker blue

const kSecondaryColor = Color(0xFFFFA372); // Orange
const kSecondaryDarkerColor = Color(0xFFED6663); // Darker orange

const appBarIconTheme = IconThemeData(color: Colors.white);

const fontFamily = "SF Pro";
const boldFontFamily = "SF Pro Bold";

TextStyle getAppBarTextStyle(BuildContext context) {
  return TextStyle(
    color: Colors.white,
    fontFamily: boldFontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.060,
  );
}

Widget flexibleSpace = Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [kSecondaryColor, kSecondaryDarkerColor],
    ),
  ),
);

const String CURRENT_LOCATION = "Current location";
