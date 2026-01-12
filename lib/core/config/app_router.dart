import 'package:auto_route/auto_route.dart';
import 'package:ridge_fin/core/config/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: AuthLandingRoute.page,
      path: '/landing',
      initial: true,
    ),
    AutoRoute(
      page: AuthEnterEmailRoute.page,
      path: '/enter-email',
    ),
    AutoRoute(
      page: AuthLoginRoute.page,
      path: '/login',
    ),
    AutoRoute(
      page: AuthRegisterRoute.page,
      path: '/register',
    ),
  ];
}
