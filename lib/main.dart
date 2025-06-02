import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as service;
import 'package:logger/logger.dart';
import 'package:swastha_ai/di/service_locator.dart';

import 'app/app.dart';

final logger = Logger();

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setupLocator();

    service.SystemChrome.setPreferredOrientations([
      service.DeviceOrientation.portraitUp,
    ]).then((_) {
      runApp(const App());
    });
  }, (error, stackTrace) => logger.e(error.toString()));
}
