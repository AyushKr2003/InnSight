import 'package:flutter/material.dart';

final ThemeData innSightDarkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF121212), // Deep charcoal
  primaryColor: const Color(0xFFD4AF37), // Gold accent
  fontFamily: 'Montserrat',

  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFD4AF37), // Gold
    secondary: Color(0xFF424242), // Slightly lighter dark for cards
    background: Color(0xFF1E1E1E),
    surface: Color(0xFF2C2C2C),
    onPrimary: Colors.black,
    onSecondary: Colors.white,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1C1C1C),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF2C2C2C),
    labelStyle: const TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFD4AF37)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFD4AF37), width: 2),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFD4AF37),
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  ),

  cardColor: const Color(0xFF2C2C2C),
  dividerColor: Colors.grey[700],
  iconTheme: const IconThemeData(color: Color(0xFFD4AF37)),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(color: Colors.white70),
  ),
);
