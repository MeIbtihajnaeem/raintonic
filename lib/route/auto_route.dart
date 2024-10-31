import 'package:auto_route/auto_route.dart';

import 'auto_route.gr.dart';

// flutter packages pub run build_runner build --delete-conflicting-outputs

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  AppRouter();

  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: "/", initial: true),
        AutoRoute(page: HomeRoute.page, path: "/home"),
        AutoRoute(page: SingleCityScreenRoute.page, path: "/single_city_route"),
        AutoRoute(page: FavoriteRoute.page, path: "/favorite_route")
      ];
}
