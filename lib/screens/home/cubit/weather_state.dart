part of 'weather_cubit.dart';

class WeatherState extends Equatable {
  final CityLocationModel? cityDetails;
  final String error;
  final TemperatureModel? temperatureModel;
  final APISTATUS apiStatus;

  const WeatherState({
    this.cityDetails,
    this.error = "",
    this.apiStatus = APISTATUS.none,
    this.temperatureModel,
  });

  static WeatherState emptyState() => const WeatherState();

  WeatherState copyWith(
          {String? error,
          APISTATUS? apiStatus,
          CityLocationModel? cityDetails,
          TemperatureModel? temperatureModel}) =>
      WeatherState(
          temperatureModel: temperatureModel ?? this.temperatureModel,
          cityDetails: cityDetails ?? this.cityDetails,
          error: error ?? this.error,
          apiStatus: apiStatus ?? this.apiStatus);

  @override
  List<Object?> get props => [
        cityDetails,
        error,
        temperatureModel,
        apiStatus,
      ];
}
