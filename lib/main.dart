import 'package:flutter/material.dart';
import 'package:ridge_fin/app.dart';
import 'package:ridge_fin/core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();

  runApp(const App());
}
