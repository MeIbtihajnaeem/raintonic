import 'package:api_repository/api_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:raintonic/commons/cubit/favorite_cubit.dart';

import '../../styles.dart';
import 'add_favourite_widget.dart';
import 'chart_widget.dart';

@RoutePage(name: 'SingleCityScreenRoute')
class SingleCityScreen extends StatelessWidget {
  final CityLocationModel cityModel;
  final TemperatureModel? model;

  const SingleCityScreen(
      {super.key, required this.cityModel, required this.model});

  @override
  Widget build(BuildContext context) {
    WeatherModel? weather = cityModel.weather;
    if (weather == null) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Details"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Styles.primaryColor, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  StarWidget(
                    isFavorite: context
                        .read<FavoriteCubit>()
                        .checkIfCityIsFavorite(cityModel.name ?? ""),
                    onChanged: (value) {
                      context.read<FavoriteCubit>().saveCity(cityModel);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildLocationInfo(weather),
              const SizedBox(height: 16),
              _buildCurrentWeatherInfo(weather),
              const SizedBox(height: 16),
              if (model != null)
                TemperatureChart(
                  data: model,
                )
              else
                Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationInfo(WeatherModel weather) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white.withOpacity(0.9),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Location Info",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Text("Latitude: ${weather.latitude}", style: _infoTextStyle()),
            Text("Longitude: ${weather.longitude}", style: _infoTextStyle()),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentWeatherInfo(WeatherModel weather) {
    final current = weather.current;
    final currentUnits = weather.currentUnits;
    if (current == null || currentUnits == null) return Container();

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white.withOpacity(0.9),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Current Weather",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            _weatherInfoRow(
              icon: FontAwesomeIcons.temperatureFull,
              label: "Temperature",
              value:
                  "${current.temperature2M ?? 'N/A'}${currentUnits.temperature2M}",
            ),
            _weatherInfoRow(
              icon: FontAwesomeIcons.anchor,
              label: "Humidity",
              value:
                  "${current.relativeHumidity2M ?? 'N/A'}${currentUnits.relativeHumidity2M}",
            ),
            _weatherInfoRow(
              icon: FontAwesomeIcons.wind,
              label: "Wind Speed",
              value:
                  "${current.windSpeed10M ?? 'N/A'} ${currentUnits.windSpeed10M}",
            ),
            _weatherInfoRow(
              icon: FontAwesomeIcons.cloudRain,
              label: "Rain",
              value: "${current.rain ?? 'N/A'} ${currentUnits.rain}",
            ),
            _weatherInfoRow(
              icon: FontAwesomeIcons.snowflake,
              label: "Snowfall",
              value: "${current.snowfall ?? 'N/A'} ${currentUnits.snowfall}",
            ),
            _weatherInfoRow(
              icon: FontAwesomeIcons.cloud,
              label: "Cloud Cover",
              value:
                  "${current.cloudCover ?? 'N/A'} ${currentUnits.cloudCover}",
            ),
            _weatherInfoRow(
              icon: FontAwesomeIcons.cloudSunRain,
              label: "Weather Code",
              value:
                  "${current.weatherCode ?? 'N/A'} ${currentUnits.weatherCode}",
            ),
          ],
        ),
      ),
    );
  }

  Widget _weatherInfoRow(
      {required IconData icon, required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 20),
          const SizedBox(width: 12),
          Text(label,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const Spacer(),
          Text(value,
              style: const TextStyle(fontSize: 16, color: Colors.black87)),
        ],
      ),
    );
  }

  TextStyle _infoTextStyle() =>
      const TextStyle(fontSize: 16, color: Colors.black87);
}
