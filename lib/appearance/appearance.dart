import 'package:flutter/material.dart';

abstract class Appearance {
  ThemeData get appTheme;

  Color get accentColor;

  Color get primaryButtonColor;

  TextStyle get primaryButtonTitleStyle;

  TextStyle get centerMessageTextStyle;

  double get textFieldDefaultHeight;

  BoxDecoration get textFieldDecoration;
}
