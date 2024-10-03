import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unique/app.dart';

void main() async {
  await initialize();

  runApp(const App());
}

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}


