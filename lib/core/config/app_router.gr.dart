// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:ridge_fin/features/auth/pages/enter_email.dart' as _i1;
import 'package:ridge_fin/features/auth/pages/landing.dart' as _i2;
import 'package:ridge_fin/features/auth/pages/login.dart' as _i3;
import 'package:ridge_fin/features/auth/pages/register.dart' as _i4;
import 'package:ridge_fin/features/watchlist/pages/search_stock.dart' as _i6;
import 'package:ridge_fin/features/watchlist/pages/stock_quote.dart' as _i7;
import 'package:ridge_fin/features/watchlist/pages/watchlist.dart' as _i5;

/// generated route for
/// [_i1.AuthEnterEmailPage]
class AuthEnterEmailRoute extends _i8.PageRouteInfo<void> {
  const AuthEnterEmailRoute({List<_i8.PageRouteInfo>? children})
    : super(AuthEnterEmailRoute.name, initialChildren: children);

  static const String name = 'AuthEnterEmailRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthEnterEmailPage();
    },
  );
}

/// generated route for
/// [_i2.AuthLandingPage]
class AuthLandingRoute extends _i8.PageRouteInfo<void> {
  const AuthLandingRoute({List<_i8.PageRouteInfo>? children})
    : super(AuthLandingRoute.name, initialChildren: children);

  static const String name = 'AuthLandingRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.AuthLandingPage();
    },
  );
}

/// generated route for
/// [_i3.AuthLoginPage]
class AuthLoginRoute extends _i8.PageRouteInfo<AuthLoginRouteArgs> {
  AuthLoginRoute({
    _i9.Key? key,
    String email = '',
    List<_i8.PageRouteInfo>? children,
  }) : super(
         AuthLoginRoute.name,
         args: AuthLoginRouteArgs(key: key, email: email),
         rawPathParams: {'email': email},
         initialChildren: children,
       );

  static const String name = 'AuthLoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<AuthLoginRouteArgs>(
        orElse: () =>
            AuthLoginRouteArgs(email: pathParams.getString('email', '')),
      );
      return _i3.AuthLoginPage(key: args.key, email: args.email);
    },
  );
}

class AuthLoginRouteArgs {
  const AuthLoginRouteArgs({this.key, this.email = ''});

  final _i9.Key? key;

  final String email;

  @override
  String toString() {
    return 'AuthLoginRouteArgs{key: $key, email: $email}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AuthLoginRouteArgs) return false;
    return key == other.key && email == other.email;
  }

  @override
  int get hashCode => key.hashCode ^ email.hashCode;
}

/// generated route for
/// [_i4.AuthRegisterPage]
class AuthRegisterRoute extends _i8.PageRouteInfo<AuthRegisterRouteArgs> {
  AuthRegisterRoute({
    _i9.Key? key,
    String email = '',
    List<_i8.PageRouteInfo>? children,
  }) : super(
         AuthRegisterRoute.name,
         args: AuthRegisterRouteArgs(key: key, email: email),
         rawPathParams: {'email': email},
         initialChildren: children,
       );

  static const String name = 'AuthRegisterRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<AuthRegisterRouteArgs>(
        orElse: () =>
            AuthRegisterRouteArgs(email: pathParams.getString('email', '')),
      );
      return _i4.AuthRegisterPage(key: args.key, email: args.email);
    },
  );
}

class AuthRegisterRouteArgs {
  const AuthRegisterRouteArgs({this.key, this.email = ''});

  final _i9.Key? key;

  final String email;

  @override
  String toString() {
    return 'AuthRegisterRouteArgs{key: $key, email: $email}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AuthRegisterRouteArgs) return false;
    return key == other.key && email == other.email;
  }

  @override
  int get hashCode => key.hashCode ^ email.hashCode;
}

/// generated route for
/// [_i5.WatchlistPage]
class WatchlistRoute extends _i8.PageRouteInfo<void> {
  const WatchlistRoute({List<_i8.PageRouteInfo>? children})
    : super(WatchlistRoute.name, initialChildren: children);

  static const String name = 'WatchlistRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.WatchlistPage();
    },
  );
}

/// generated route for
/// [_i6.WatchlistSearchStockPage]
class WatchlistSearchStockRoute extends _i8.PageRouteInfo<void> {
  const WatchlistSearchStockRoute({List<_i8.PageRouteInfo>? children})
    : super(WatchlistSearchStockRoute.name, initialChildren: children);

  static const String name = 'WatchlistSearchStockRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.WatchlistSearchStockPage();
    },
  );
}

/// generated route for
/// [_i7.WatchlistStockQuotePage]
class WatchlistStockQuoteRoute extends _i8.PageRouteInfo<void> {
  const WatchlistStockQuoteRoute({List<_i8.PageRouteInfo>? children})
    : super(WatchlistStockQuoteRoute.name, initialChildren: children);

  static const String name = 'WatchlistStockQuoteRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.WatchlistStockQuotePage();
    },
  );
}
