import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../view/home/home_view.dart';
import '../../view/settings/settings_view.dart';
import '../../view/splash/splash_view.dart';

class RouteManager {
  GoRouter get router => GoRouter(
        routes: [
          //   GoRoute(path: '/', builder: (BuildContext context, GoRouterState state) => const SplashView()),
          GoRoute(path: '/', builder: (BuildContext context, GoRouterState state) => const HomeView()),
          GoRoute(
              path: '/settings',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return CustomTransitionPage(
                  child: const SettingsView(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return _settingsViewAnimation(animation, child);
                  },
                );
              }),
        ],
      );

  SlideTransition _settingsViewAnimation(Animation<double> animation, Widget child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}
