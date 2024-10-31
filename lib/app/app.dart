import 'package:api_repository/api_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raintonic/screens/home/cubit/city_cubit.dart';

import '../commons/cubit/favorite_cubit.dart';
import '../route/auto_route.dart';

@RoutePage(name: 'AppRoute')
class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    MediaQueryData windowData = MediaQueryData.fromView(View.of(context));
    windowData = windowData.copyWith(
      textScaler: const TextScaler.linear(1.0),
    );
    return MediaQuery(
      data: windowData,
      child: RepositoryProvider(
        create: (context) => WeatherController(ApiWeatherServices(
            LocationClient.getClient(), WeatherClient.getClient())),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CityCubit(
                  CityController(ApiCityServices(CityClient.getClient()))),
            ),
            BlocProvider(
              create: (context) => FavoriteCubit(),
            ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          ),
        ),
      ),
    );
  }
}
