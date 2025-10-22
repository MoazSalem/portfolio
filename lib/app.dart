import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/modules/main_body.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: AppTheme.darkTheme,
      home: const Scaffold(body: MainBody()),
    );
  }
}
