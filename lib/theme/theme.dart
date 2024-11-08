import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade400,
    inversePrimary: Colors.grey.shade800
  )
);


ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        surface: Color.fromARGB(255, 24, 24, 24),
        primary: Color.fromARGB(255, 34, 34, 34),
        secondary: Color.fromARGB(255, 49, 49, 49),
        inversePrimary: Colors.grey.shade300
    )
);