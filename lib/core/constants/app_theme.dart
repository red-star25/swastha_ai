import 'package:flutter/material.dart';
import 'package:swastha_ai/core/constants/colors.dart';

final ThemeData themeData = ThemeData(
  fontFamily: 'Sora', // default font for headings
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.white,
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Sora',
      fontWeight: FontWeight.w700,
      fontSize: 32,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Sora',
      fontWeight: FontWeight.w600,
      fontSize: 24,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w300,
      fontSize: 14,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w500,
      fontSize: 12,
    ),
  ),
);

final ThemeData themeDataDark = ThemeData(
  fontFamily: 'Sora',
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.darkGrey,
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Sora',
      fontWeight: FontWeight.w700,
      fontSize: 32,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Sora',
      fontWeight: FontWeight.w600,
      fontSize: 24,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Colors.white70,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w300,
      fontSize: 14,
      color: Colors.white60,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: Colors.white60,
    ),
  ),
);
