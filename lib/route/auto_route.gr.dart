// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_repository/api_repository.dart' as _i8;
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:raintonic/app/app.dart' as _i3;
import 'package:raintonic/screens/favorite_screen/favorite_screen.dart' as _i1;
import 'package:raintonic/screens/home/home_screen.dart' as _i2;
import 'package:raintonic/screens/single_city_details_screen/single_city_screen.dart'
    as _i4;
import 'package:raintonic/screens/splash/splash_screen.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    FavoriteRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.FavoriteScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    AppRoute.name: (routeData) {
      final args =
          routeData.argsAs<AppRouteArgs>(orElse: () => const AppRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.MyApp(key: args.key),
      );
    },
    SingleCityScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SingleCityScreenRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.SingleCityScreen(
          key: args.key,
          cityModel: args.cityModel,
          model: args.model,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.FavoriteScreen]
class FavoriteRoute extends _i6.PageRouteInfo<void> {
  const FavoriteRoute({List<_i6.PageRouteInfo>? children})
      : super(
          FavoriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MyApp]
class AppRoute extends _i6.PageRouteInfo<AppRouteArgs> {
  AppRoute({
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          AppRoute.name,
          args: AppRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AppRoute';

  static const _i6.PageInfo<AppRouteArgs> page =
      _i6.PageInfo<AppRouteArgs>(name);
}

class AppRouteArgs {
  const AppRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'AppRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.SingleCityScreen]
class SingleCityScreenRoute
    extends _i6.PageRouteInfo<SingleCityScreenRouteArgs> {
  SingleCityScreenRoute({
    _i7.Key? key,
    required _i8.CityLocationModel cityModel,
    required _i8.TemperatureModel? model,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          SingleCityScreenRoute.name,
          args: SingleCityScreenRouteArgs(
            key: key,
            cityModel: cityModel,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'SingleCityScreenRoute';

  static const _i6.PageInfo<SingleCityScreenRouteArgs> page =
      _i6.PageInfo<SingleCityScreenRouteArgs>(name);
}

class SingleCityScreenRouteArgs {
  const SingleCityScreenRouteArgs({
    this.key,
    required this.cityModel,
    required this.model,
  });

  final _i7.Key? key;

  final _i8.CityLocationModel cityModel;

  final _i8.TemperatureModel? model;

  @override
  String toString() {
    return 'SingleCityScreenRouteArgs{key: $key, cityModel: $cityModel, model: $model}';
  }
}

/// generated route for
/// [_i5.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
