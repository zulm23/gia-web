import 'package:flutter/material.dart';
import 'package:web_gia/app/constants/app_constants.dart';

class AppTheme {
  static ThemeData get basic => ThemeData(
        fontFamily: Font.nunito,
        canvasColor: Colors.white,
        primarySwatch: Colors.indigo,
      );

  // you can add other custom theme in this class like  light theme, dark theme ,etc.

  // example :
  // static ThemeData get light => ThemeData();
  // static ThemeData get dark => ThemeData();
}
