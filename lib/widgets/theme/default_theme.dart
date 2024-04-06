import 'package:flutter/material.dart';

ThemeData getDefaultTheme() {
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xff23202a),
    appBarTheme: AppBarTheme(
      color: Colors.blueAccent[400],
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: Colors.white70,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.grey[800]),
    ),
    iconTheme: const IconThemeData(color: Colors.grey),
  );
}
