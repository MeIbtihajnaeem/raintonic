import 'package:api_repository/api_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raintonic/commons/api_status.dart';
import 'package:raintonic/screens/home/cubit/weather_cubit.dart';

import '../../../commons/message_snake.dart';
import '../../../route/auto_route.gr.dart';
import '../../../commons/city_tile.dart';

class CityListWidget extends StatelessWidget {
  final List<String> cities;
  const CityListWidget({super.key, required this.cities});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 250,
        child: ListView.builder(
            itemCount: cities.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return BlocProvider(
                create: (context) =>
                    WeatherCubit(context.read<WeatherController>()),
                child: BlocListener<WeatherCubit, WeatherState>(
                  listenWhen: (pre, nxt) => pre.apiStatus != nxt.apiStatus,
                  listener: (context, state) {
                    if (state.apiStatus == APISTATUS.loaded) {
                      var data = state.cityDetails;
                      if (data != null) {
                        AutoRouter.of(context).push(SingleCityScreenRoute(
                            cityModel: data, model: state.temperatureModel));
                      }
                    } else if (state.apiStatus == APISTATUS.error) {
                      Utils.showSnackBar(context, state.error);
                    }
                  },
                  child: CityTile(
                    cityName: cities[index],
                    onTap: (newContext) {
                      newContext
                          .read<WeatherCubit>()
                          .loadWeatherDataOfSingleCity(cities[index]);
                    },
                  ),
                ),
              );
            }),
      ),
    );
  }
}
