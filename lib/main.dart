import 'package:app_nation_case_study/product/theme/light_theme.dart';
import 'package:app_nation_case_study/view/home/home_view.dart';
import 'package:app_nation_case_study/view/splash/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppNation Case Study App',
      debugShowCheckedModeBanner: false,
      theme: LightTheme().themeData,
      home: const SplashView(),
    );
  }
}
