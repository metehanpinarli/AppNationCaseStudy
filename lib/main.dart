import 'package:app_nation_case_study/product/routes/route_manager.dart';
import 'package:app_nation_case_study/product/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'injectable.dart';

Future<void> main() async {
  _init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'AppNation Case Study App',
      debugShowCheckedModeBanner: false,
      theme: LightTheme().themeData,
      routerConfig: RouteManager().router,
    );
  }
}

Future _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await setupLocator();
}
