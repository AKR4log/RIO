// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:rio/page/bonus.dart';
import 'package:rio/page/cat_gift.dart';
import 'package:rio/page/description.dart';
import 'package:rio/page/ruble.dart';

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
        return SlideLeftRoute<bool>(
            builder: (BuildContext context) => const Home());
        break;
      case "Bonus":
        return SlideLeftRoute<bool>(
            builder: (BuildContext context) => const Bonus());
        break;
      case "Description":
        return SlideLeftRoute<bool>(
            builder: (BuildContext context) => const Description());
        break;
      case "CatGift":
        return SlideLeftRoute<bool>(
            builder: (BuildContext context) => const CatGift());
        break;
      case "Ruble":
        return SlideLeftRoute<bool>(
            builder: (BuildContext context) => const Ruble());
        break;
      case "LoginPage":
        return SlideLeftRoute<bool>(
            builder: (BuildContext context) => const LoginPage());
        break;
    }
  }
}
