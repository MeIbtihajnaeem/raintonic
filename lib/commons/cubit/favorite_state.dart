part of 'favorite_cubit.dart';

class FavoriteState extends Equatable {
  final List<CityLocationModel> savedCities;
  final List<CityLocationModel> sortedByTemperature;
  final bool sort;

  const FavoriteState({
    this.sort = false,
    this.savedCities = const [],
    this.sortedByTemperature = const [],
  });

  FavoriteState copyWith(
          {List<CityLocationModel>? savedCities,
          List<CityLocationModel>? sortedByTemperature,
          bool? sort}) =>
      FavoriteState(
          sort: sort ?? this.sort,
          savedCities: savedCities ?? this.savedCities,
          sortedByTemperature: sortedByTemperature ?? this.sortedByTemperature);

  factory FavoriteState.fromMap(Map<String, dynamic> json) {
    return FavoriteState(
        savedCities: List<CityLocationModel>.from(
            json["cities"].map((x) => CityLocationModel.fromJson(x))));
  }

  @override
  List<Object> get props => [savedCities, sortedByTemperature, sort];
}
