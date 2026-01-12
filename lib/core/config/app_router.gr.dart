// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:ridge_fin/features/auth/pages/enter_email.dart' as _i1;
import 'package:ridge_fin/features/auth/pages/landing.dart' as _i2;
import 'package:ridge_fin/features/auth/pages/login.dart' as _i3;
import 'package:ridge_fin/features/auth/pages/register.dart' as _i4;

/// generated route for
/// [_i1.AuthEnterEmailPage]
class AuthEnterEmailRoute extends _i5.PageRouteInfo<void> {
  const AuthEnterEmailRoute({List<_i5.PageRouteInfo>? children})
    : super(AuthEnterEmailRoute.name, initialChildren: children);

  static const String name = 'AuthEnterEmailRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthEnterEmailPage();
    },
  );
}

/// generated route for
/// [_i2.AuthLandingPage]
class AuthLandingRoute extends _i5.PageRouteInfo<void> {
  const AuthLandingRoute({List<_i5.PageRouteInfo>? children})
    : super(AuthLandingRoute.name, initialChildren: children);

  static const String name = 'AuthLandingRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.AuthLandingPage();
    },
  );
}

/// generated route for
/// [_i3.AuthLoginPage]
class AuthLoginRoute extends _i5.PageRouteInfo<void> {
  const AuthLoginRoute({List<_i5.PageRouteInfo>? children})
    : super(AuthLoginRoute.name, initialChildren: children);

  static const String name = 'AuthLoginRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.AuthLoginPage();
    },
  );
}

/// generated route for
/// [_i4.AuthRegisterPage]
class AuthRegisterRoute extends _i5.PageRouteInfo<void> {
  const AuthRegisterRoute({List<_i5.PageRouteInfo>? children})
    : super(AuthRegisterRoute.name, initialChildren: children);

  static const String name = 'AuthRegisterRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.AuthRegisterPage();
    },
  );
}
