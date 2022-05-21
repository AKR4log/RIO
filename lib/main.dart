import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/routes/router.dart';
import 'utils/state/app_state.dart';
import 'utils/state/feed_service_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AppState>(create: (_) => AppState()),
          ChangeNotifierProvider<FeedServiceState>(
              create: (_) => FeedServiceState()),
        ],
        child: MaterialApp(
          theme: ThemeData(
            fontFamily: 'Montserrat',
          ),
          debugShowCheckedModeBanner: false,
          routes: Routes.route(),
          onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
          initialRoute: "SplashPage",
        ));
  }
}
