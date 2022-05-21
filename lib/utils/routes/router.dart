// ignore_for_file: missing_return

import 'package:flutter/material.dart';

import '../../page/connect/login.dart';
import '../../page/home.dart';
import '../../page/splash.dart';
import 'custom_router.dart';

class Routes {
  static dynamic route() {
    return {
      'SplashPage': (BuildContext context) => SplashPage(),
    };
  }

  static Route onGenerateRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name.split('/');
    if (pathElements[0] != '' || pathElements.length == 1) {
      return null;
    }
    switch (pathElements[1]) {
      case "HomePage":
        return CustomRoute<bool>(
            builder: (BuildContext context) => const Home());
        break;
      case "LoginPage":
        return CustomRoute<bool>(
            builder: (BuildContext context) => const LoginPage());
        break;
    }
  }
}
