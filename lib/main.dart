import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mozz/src/application.dart';
import 'package:mozz/src/service_locator.dart' as sl;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await sl.init();

  runApp(const Application());
}
