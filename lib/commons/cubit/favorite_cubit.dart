import 'package:api_repository/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'favorite_state.dart';

class FavoriteCubit extends HydratedCubit<FavoriteState> {
  FavoriteCubit() : super(const FavoriteState());

  void saveCity(CityLocationModel city) {
    List<CityLocationModel> allCities = state.savedCities;
    int index = allCities.indexWhere((c) => c.name == city.name);
    if (index != -1) {
      allCities.removeAt(index);
    } else {
      allCities.add(city);
    }
    emit(state.copyWith(savedCities: allCities));
  }

  Future<void> loadCities() async {
    emit(state.copyWith(savedCities: state.savedCities));
  }

  Future<void> sortCitiesByTemperature() async {
    List<CityLocationModel> cities = state.savedCities;
    if (!state.sort) {
      cities.sort((a, b) {
        final tempA = a.weather?.current?.temperature2M ??
            double.negativeInfinity; // Use a fallback value if null
        final tempB = b.weather?.current?.temperature2M ??
            double.negativeInfinity; // Use a fallback value if null

        return tempA.compareTo(tempB);
      });
      emit(state.copyWith(sort: true, sortedByTemperature: cities));
    } else {
      emit(state.copyWith(sortedByTemperature: [], sort: false));
    }
  }

  bool checkIfCityIsFavorite(String cityName) {
    int index = state.savedCities.indexWhere((c) => c.name == cityName);
    if (index != -1) {
      return true;
    }
    return false;
  }

  @override
  FavoriteState? fromJson(Map<String, dynamic> json) {
    return FavoriteState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(FavoriteState state) {
    return {
      "cities": List<Map<String, dynamic>>.from(
          state.savedCities.map((x) => x.toJson()))
    };
  }
}
