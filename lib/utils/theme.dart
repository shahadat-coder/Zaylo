import 'package:flutter/material.dart';
import 'package:zaylo/utils/colors.dart';

class AppThemes{
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: AppColors.primaryColors,
      textTheme: const TextTheme(
          displayMedium: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.white
          )
      ),
      colorScheme: const ColorScheme.light(
          primary: AppColors.primaryColors
      )
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: AppColors.primaryColors,
    textTheme: const TextTheme(
        displayMedium: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Colors.white
        )
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColors,
    ),
  );
}