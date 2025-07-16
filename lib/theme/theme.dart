import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Color(0xffadd8e6),
    surfaceTint: Color(0xffd079dc),
    primary: Colors.indigo.shade900,
    secondary: Colors.indigo.shade600,
    tertiary: Colors.indigoAccent.shade100,
    onTertiary: Color(0xff1a1a2e),
    tertiaryFixed: Color(0xff00adb5),
  ),
);

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Color(0xff1a1a2e),
    surfaceTint: Color(0xff00adb5),
    primary: Colors.blueGrey.shade300,
    secondary: Colors.blueGrey.shade100,
    tertiary: Colors.blueGrey.shade900,
    onTertiary: Color(0xffadd8e6),
    tertiaryFixed: Color(0xffd079dc),
  ),
);
