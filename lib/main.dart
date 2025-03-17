import 'package:delala/app.dart';
import 'package:delala/injector.dart';
import 'package:flutter/material.dart';

Future<void> main() async  {
  await initInjector();
  runApp(const App());
}
