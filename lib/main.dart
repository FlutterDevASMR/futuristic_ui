import 'package:flutter/material.dart';
import 'package:futuristic_ui/screens/home_screen.dart';
import 'package:futuristic_ui/utils/background_part.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          BackgroundPart(),
          HomeScreen(),
        ],
      ),
    );
  }
}
