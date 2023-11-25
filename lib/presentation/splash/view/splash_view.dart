import 'package:flutter/material.dart';
import '../../../product/resources/assets/assets_constants.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AssetImages.im_splash_logo.path())),
    );
  }
}
