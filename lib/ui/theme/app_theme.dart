import 'package:flutter/material.dart';
import 'colors.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: deepNight,
  colorScheme: const ColorScheme.dark(
    primary: parchmentGold,
    onPrimary: deepNight,
    secondary: arcaneBlue,
    surface: surfaceDark,
    onSurface: textLight,
    error: dangerRed,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: deepNight,
    foregroundColor: textLight,
    elevation: 0,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
        bodyColor: textLight,
        displayColor: textLight,
      ),
);
