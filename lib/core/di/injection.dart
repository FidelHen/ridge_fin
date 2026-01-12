import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:ridge_fin/core/bloc/session_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  await _loadEnv();
  await _setupSupabase();
  _setupBlocs();
}

Future<void> _loadEnv() async {
  await dotenv.load(fileName: '.env');
}

Future<void> _setupSupabase() async {}

Future<void> _setupBlocs() async {
  getIt.registerSingleton<SessionBloc>(SessionBloc());
}
