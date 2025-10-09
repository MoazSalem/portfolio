import 'package:flutter/material.dart';
import 'package:portfolio/intro_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyanAccent,
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        body: const IntroAnimation(
          rectWidth: 200,
          duration: Duration(milliseconds: 800),
        ),
      ),
    );
  }
}
