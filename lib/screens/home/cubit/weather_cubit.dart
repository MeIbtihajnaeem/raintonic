import 'package:api_repository/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../commons/api_status.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherController _controller;
  WeatherCubit(this._controller) : super(const WeatherState());

  void loadWeatherDataOfSingleCity(String cityName) async {
    emit(state.copyWith(apiStatus: APISTATUS.none));
    emit(state.copyWith(apiStatus: APISTATUS.loading));
    try {
      CityLocationModel model = await _controller.getCityDetails(cityName);
      TemperatureModel temperatureModel =
          await _controller.getCity24HourTemperatureData(model);
      emit(state.copyWith(
          cityDetails: model,
          temperatureModel: temperatureModel,
          apiStatus: APISTATUS.loaded));
    } catch (e) {
      emit(state.copyWith(apiStatus: APISTATUS.error, error: e.toString()));
    }
  }
}
