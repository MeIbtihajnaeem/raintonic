import 'package:api_repository/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:string_similarity/string_similarity.dart';

import '../../../commons/api_status.dart';

part 'city_state.dart';

class CityCubit extends HydratedCubit<CityState> {
  final CityController _controller;
  CityCubit(this._controller) : super(CityState.emptyState());

  void loadCities() async {
    if (state.loadedCities.isEmpty) {
      emit(state.copyWith(apiStatus: APISTATUS.none));
      emit(state.copyWith(apiStatus: APISTATUS.loading));
      try {
        List<String> cities = await _controller.getCities();
        emit(state.copyWith(
            apiStatus: APISTATUS.loaded,
            loadedCities: cities,
            citySuggestions: cities));
      } catch (e) {
        emit(state.copyWith(error: e.toString(), apiStatus: APISTATUS.error));
      }
    } else {
      emit(state.copyWith(
          apiStatus: APISTATUS.loaded,
          loadedCities: state.loadedCities,
          citySuggestions: state.loadedCities));
    }
  }

  void searchCity(String text) async {
    emit(state.copyWith(apiStatus: APISTATUS.none));
    emit(state.copyWith(apiStatus: APISTATUS.loading));
    try {
      if (text.isEmpty || text == "") {
        emit(state.copyWith(citySuggestions: state.loadedCities));
      } else {
        List<String> searchResults = state.loadedCities
            .where((city) => city.similarityTo(text) > 0.5)
            .toList();
        searchResults.sort(
            (a, b) => b.similarityTo(text).compareTo(a.similarityTo(text)));
        emit(state.copyWith(
            citySuggestions: searchResults, apiStatus: APISTATUS.loaded));
      }
    } catch (e) {
      emit(state.copyWith(error: e.toString(), apiStatus: APISTATUS.error));
    }
  }

  @override
  CityState? fromJson(Map<String, dynamic> json) {
    return CityState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CityState state) {
    return {"cities": List<String>.from(state.loadedCities), "error": ""};
  }
}
