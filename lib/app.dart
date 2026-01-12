import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ridge_fin/core/bloc/session_bloc.dart';
import 'package:ridge_fin/core/config/app_router.dart';
import 'package:ridge_fin/core/di/injection.dart';
import 'package:ridge_fin/core/theme/app_theme.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => getIt<SessionBloc>())],
      child: BlocListener<SessionBloc, SessionState>(
        listener: (context, state) {},
        child: MaterialApp.router(
          routerConfig: _appRouter.config(),
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
        ),
      ),
    );
  }
}
