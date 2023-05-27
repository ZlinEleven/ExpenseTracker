import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

var customColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 58, 181));

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: customColorScheme.secondaryContainer,
        colorScheme: customColorScheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: customColorScheme.primaryContainer,
          ),
        ),
        cardTheme: const CardTheme(
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: customColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      ),
      home: const Expenses(),
    ),
  );
}
