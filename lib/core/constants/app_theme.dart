import 'package:flutter/material.dart';
import 'package:swastha_ai/core/constants/colors.dart';
import 'package:swastha_ai/core/constants/constants.dart';

final ThemeData themeData = ThemeData(
  fontFamily: kFontPlusJakartaSans,
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.white,
  primaryColor: AppColors.primary,
);

final ThemeData themeDataDark = ThemeData(
  fontFamily: kFontPlusJakartaSans,
  brightness: Brightness.dark,
  primaryColor: AppColors.secondary,
);
