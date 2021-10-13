import 'package:flutter/material.dart';

import 'appearance.dart';

class LightAppearance extends Appearance {
  static const teal = Colors.teal;

  @override
  ThemeData get appTheme {
    return ThemeData(
      brightness: Brightness.light,
      //fontFamily: 'GothamPro',
      canvasColor: const Color(0xFFF6F8F9),
      scaffoldBackgroundColor: const Color(0xFFF6F8F9),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 1.0,
        iconTheme: IconThemeData(
          size: 28.0,
          color: teal,
        ),
        actionsIconTheme: IconThemeData(
          color: teal,
          size: 28.0,
        ),
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(
          color: Color(0xFF000000),
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
        subtitle2: TextStyle(
          color: Color(0xFF151622),
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        labelStyle: TextStyle(
          height: 0.8,
          color: Color(0xFF8E93A3),
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),
        hintStyle: TextStyle(
          color: Color(0xFF8E93A3),
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Color(0xFF8E93A3),
        size: 20.0,
      ),
      primaryIconTheme: const IconThemeData(
        color: Color(0xFF8E93A3),
        size: 20.0,
      ),
    );
  }

  @override
  Color get accentColor => const Color(0xFFFFA800);

  @override
  Color get primaryButtonColor => Colors.teal;

  @override
  TextStyle get primaryButtonTitleStyle => const TextStyle(
        fontSize: 18,
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.w500,
      );

  @override
  BoxDecoration get textFieldDecoration => BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: const BorderRadius.all(
          Radius.circular(6.00),
        ),
        border: Border.all(
          color: const Color(0xFFFFFFFF),
          width: 1.0,
        ),
      );

  @override
  double get textFieldDefaultHeight => 54.0;

  @override
  TextStyle get centerMessageTextStyle => const TextStyle(
        fontSize: 18,
        color: Colors.teal,
        fontWeight: FontWeight.w500,
      );
}
