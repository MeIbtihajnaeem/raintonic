import 'package:api_repository/api_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raintonic/commons/cubit/favorite_cubit.dart';
import 'package:raintonic/commons/city_tile.dart';

import '../../route/auto_route.gr.dart';
import '../../styles.dart';

@RoutePage(name: 'FavoriteRoute')
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavoriteCubit>().loadCities();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather Dashboard",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        backgroundColor: Styles.primaryColor,
        elevation: 4.0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {
              context.read<FavoriteCubit>().sortCitiesByTemperature();
            },
          ),
        ],
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        buildWhen: (pre, nxt) =>
            pre.savedCities.length != nxt.savedCities.length ||
            pre.sort != nxt.sort,
        builder: (context, state) {
          List<CityLocationModel> cities = state.sort == true
              ? state.sortedByTemperature
              : state.savedCities;

          // List<CityLocationModel> cities =state.savedCities;
          return ListView.builder(
              itemCount: cities.length,
              itemBuilder: (context, index) {
                var city = cities[index];
                return CityTile(
                  cityName: city.name ?? "",
                  onTap: (newContext) {
                    AutoRouter.of(context).push(
                        SingleCityScreenRoute(cityModel: city, model: null));
                  },
                );
              });
        },
      ),
    );
  }
}
