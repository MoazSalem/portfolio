import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/user.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/core/theme/theme_controller.dart';
import 'package:portfolio/core/utils/responsivity_handler.dart';
import 'package:portfolio/presentation/main_body.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeController.instance.themeMode,
      builder: (context, themeMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: user.introductionData.name,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeMode,
          home: const Scaffold(body: ResponsivityHandler(child: MainBody())),
        );
      },
    );
  }
}
