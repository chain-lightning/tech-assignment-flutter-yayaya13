import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//// Color utilities
final materialThemeData = ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(color: Colors.deepOrange),
  primaryColor: Colors.redAccent,
  secondaryHeaderColor: Colors.deepOrange,
  textTheme: const TextTheme().copyWith(bodyText1: const TextTheme().bodyText2),

);

const cupertinoTheme = CupertinoThemeData(
  primaryColor: CupertinoDynamicColor.withBrightness(
    color: Colors.redAccent,
    darkColor: Colors.black38,
  ),
  barBackgroundColor: CupertinoDynamicColor.withBrightness(
    color: Colors.blueAccent,
    darkColor: Colors.black38,
  ),
  // primaryContrastingColor: Colors.redAccent,
  scaffoldBackgroundColor: Colors.white,
);

TextStyle toolbarTextStyle(BuildContext context) {
  final textScale = MediaQuery.of(context).textScaleFactor;
  return TextStyle(
    color: Colors.white,
    fontSize: 16.0 * textScale,
  );
}

const textStyleBlackPlain = TextStyle(color: Colors.black, fontSize: 30);
const bottomTabsBackground = Colors.blueGrey;
const bottomNavTextStyle = TextStyle(color: Colors.white, fontSize: 14.0);
const toolbarButtonTextStyle = TextStyle(color: Colors.white, fontSize: 14.0);
const tabsContentText = TextStyle(color: Colors.brown, fontSize: 30);