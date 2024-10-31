part of 'city_cubit.dart';

class CityState extends Equatable {
  final List<String> loadedCities;
  final String error;
  final APISTATUS apiStatus;
  final List<String> citySuggestions;

  const CityState(
      {this.loadedCities = const [],
      this.citySuggestions = const [],
      this.error = "",
      this.apiStatus = APISTATUS.none});

  static CityState emptyState() => const CityState();

  CityState copyWith(
          {List<String>? loadedCities,
          String? error,
          APISTATUS? apiStatus,
          List<String>? citySuggestions}) =>
      CityState(
          loadedCities: loadedCities ?? this.loadedCities,
          citySuggestions: citySuggestions ?? this.citySuggestions,
          error: error ?? this.error,
          apiStatus: apiStatus ?? this.apiStatus);

  factory CityState.fromMap(Map<String, dynamic> json) {
    return CityState(
        error: '',
        loadedCities: List<String>.from(json["cities"]),
        apiStatus: APISTATUS.none);
  }

  @override
  List<Object> get props => [
        loadedCities,
        error,
        apiStatus,
        citySuggestions,
      ];
}
