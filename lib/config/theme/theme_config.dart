import 'package:flutter/material.dart';

const color = Colors.pinkAccent;

class ThemeConfig {
  ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: color,
    );
  }

  ThemeData dark() {
    return ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
            background: Colors.black12,
            onBackground: Colors.grey,
            primary: Colors.pinkAccent,
            shadow: Colors.pink),
        dialogBackgroundColor: const Color.fromARGB(255, 24, 14, 21));
  }
}
