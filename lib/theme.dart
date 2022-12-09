import 'package:flutter/material.dart';

themeDatadark() {
  return ThemeData.dark().copyWith(appBarTheme: AppBarTheme(backgroundColor: Colors.red));
}

themeDataLight() {
  return ThemeData.light().copyWith(appBarTheme: AppBarTheme(backgroundColor: Colors.amber));
}
