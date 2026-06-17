import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
      return ThemeData(
            brightness: Brightness.light,
                  primarySwatch: Colors.orange,
                        primaryColor: Colors.blueGrey[900],
                              scaffoldBackgroundColor: Colors.grey[50],
                                    appBarTheme: AppBarTheme(
                                            color: Colors.blueGrey[900],
                                                    iconTheme: const IconThemeData(color: Colors.white),
                                                          ),
                                                              );
                                                                }

                                                                  static ThemeData get darkTheme {
                                                                      return ThemeData(
                                                                            brightness: Brightness.dark,
                                                                                  primarySwatch: Colors.orange,
                                                                                        scaffoldBackgroundColor: Colors.grey[950],
                                                                                              appBarTheme: const AppBarTheme(
                                                                                                      color: Colors.black,
                                                                                                            ),
                                                                                                                );
                                                                                                                  }
                                                                                                                  }import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.orange,
      primaryColor: Colors.blueGrey[900],
      scaffoldBackgroundColor: Colors.grey[50],
      appBarTheme: AppBarTheme(
        color: Colors.blueGrey[900],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.orange,
      scaffoldBackgrou