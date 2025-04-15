import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

class WaterTracker extends StatelessWidget {
  const WaterTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: _inputDecorationTheme(),
        elevatedButtonTheme: _elevatedButtonTheme()
      ),
      home: HomeScreen(),
    );
  }
}
InputDecorationTheme _inputDecorationTheme(){
return InputDecorationTheme(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: Colors.grey, width: 1.5),
  ),
);
}
ElevatedButtonThemeData _elevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      fixedSize: Size(120, 120),
    )
  );
}