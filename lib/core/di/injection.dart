import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:ridge_fin/core/bloc/session_bloc.dart';
import 'package:ridge_fin/features/auth/repositories/auth_repository.dart';
import 'package:ridge_fin/features/watchlist/repositories/ticker_repository.dart';
import 'package:ridge_fin/features/watchlist/repositories/stock_data_repository.dart';
import 'package:ridge_fin/features/watchlist/repositories/finnhub_repository.dart';
import 'package:ridge_fin/features/watchlist/repositories/fmp_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  await _loadEnv();
  await _setupSupabase();
  _setupDio();
  _setupRepositories();
  _setupBlocs();
}

Future<void> _loadEnv() async {
  await dotenv.load(fileName: '.env');
}

Future<void> _setupSupabase() async {
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  getIt.registerLazySingleton<SupabaseClient>(
    () => Supabase.instance.client,
  );
}

void _setupDio() {
  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    ),
  );
}

void _setupRepositories() {
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt<SupabaseClient>()),
  );

  getIt.registerLazySingleton<TickerRepository>(
    () => TickerRepository(),
  );

  getIt.registerLazySingleton<StockDataRepository>(
    () => StockDataRepository(),
  );

  getIt.registerLazySingleton<FinnhubRepository>(
    () => FinnhubRepository(getIt<Dio>()),
  );

  getIt.registerLazySingleton<FmpRepository>(
    () => FmpRepository(getIt<Dio>()),
  );
}

void _setupBlocs() {
  getIt.registerSingleton<SessionBloc>(
    SessionBloc(getIt<AuthRepository>()),
  );
}
