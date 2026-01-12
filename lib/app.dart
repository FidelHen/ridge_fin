import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ridge_fin/core/bloc/session_bloc.dart';
import 'package:ridge_fin/core/config/app_router.dart';
import 'package:ridge_fin/core/config/app_router.gr.dart';
import 'package:ridge_fin/core/di/injection.dart';
import 'package:ridge_fin/core/services/cache_service.dart';
import 'package:ridge_fin/core/theme/app_theme.dart';
import 'package:ridge_fin/features/watchlist/bloc/watchlist_bloc.dart';
import 'package:ridge_fin/features/watchlist/repositories/finnhub_repository.dart';
import 'package:ridge_fin/features/watchlist/repositories/watchlist_repository.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getIt<SessionBloc>().add(const CheckAuthStatus());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<SessionBloc>()),
        BlocProvider(
          create: (context) => WatchlistBloc(
            getIt<WatchlistRepository>(),
            getIt<FinnhubRepository>(),
            getIt<CacheService>(),
          ),
        ),
      ],
      child: BlocListener<SessionBloc, SessionState>(
        listener: (context, state) {
          state.maybeWhen(
            authenticated: (_) {
              _appRouter.replaceAll([const WatchlistRoute()]);
            },
            unauthenticated: () {
              _appRouter.replaceAll([const AuthLandingRoute()]);
            },
            orElse: () {},
          );
        },
        child: MaterialApp.router(
          routerConfig: _appRouter.config(),
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
        ),
      ),
    );
  }
}
