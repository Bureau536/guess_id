import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    const seddColor = Color.fromARGB(255, 0, 45, 125);

    return ThemeData(
      colorSchemeSeed: seddColor,
      listTileTheme: const ListTileThemeData(iconColor: seddColor),
    );
  }
}
