import 'package:flutter/material.dart';
import 'package:swastha_ai/core/constants/app_theme.dart';
import 'package:swastha_ai/core/constants/constants.dart';
import 'package:swastha_ai/routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'),
      routerConfig: router,
      theme: themeData,
      title: kAppName,
    );
  }
}
