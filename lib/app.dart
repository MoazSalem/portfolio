import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/theme.dart';
import 'package:portfolio/modules/independent_animations/intro_animation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: AppTheme.darkTheme,
      home: Scaffold(
        body: const IntroAnimation(
          rectWidth: 200,
          duration: Duration(milliseconds: 800),
        ),
      ),
    );
  }
}
