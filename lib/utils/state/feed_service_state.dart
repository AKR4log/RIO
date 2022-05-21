// ignore_for_file: missing_return, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:rio/page/connect/login.dart';
import 'package:rio/page/home.dart';
import 'package:rio/service/component/database.dart';

import '../enum/auth_status.dart';
import 'app_state.dart';

class FeedServiceState extends AppState {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  Future getCurrentUser(BuildContext context) async {
    try {
      var token = await getToken();
      if (token != null && token != '') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Home()));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
        authStatus = AuthStatus.NOT_LOGGED_IN;
      }
      isBusy = true;
    } catch (error) {
      isBusy = false;
      authStatus = AuthStatus.NOT_LOGGED_IN;
      return null;
    }
  }
}
