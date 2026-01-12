import 'package:flutter/material.dart';
import 'package:ridge_fin/app.dart';
import 'package:ridge_fin/core/bloc/session_bloc.dart';
import 'package:ridge_fin/core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();

  final sessionBloc = getIt<SessionBloc>();
  sessionBloc.add(const CheckAuthStatus());

  runApp(const App());
}
