import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rio/page/connect/login.dart';
import 'package:rio/page/home.dart';
import 'package:rio/utils/state/feed_service_state.dart';

import '../utils/enum/auth_status.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      timer();
    });
    super.initState();
  }

  void timer() async {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      var state = Provider.of<FeedServiceState>(context, listen: false);
      state.getCurrentUser(context);
    });
  }

  Widget _body() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 38, bottom: 38),
            child: SvgPicture.asset(
              'assets/img/logo.svg',
              height: 75,
              width: 159,
              fit: BoxFit.fitHeight,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<FeedServiceState>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: state.authStatus == AuthStatus.NOT_DETERMINED
            ? _body()
            : state.authStatus == AuthStatus.NOT_LOGGED_IN
                ? const LoginPage()
                : const Home());
  }
}
