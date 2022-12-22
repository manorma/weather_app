import 'package:flutter/material.dart';
import 'package:flutter_weather_app/data/failure.dart';
import 'package:flutter_weather_app/domain/usecases/get_current_weather_usecase.dart';
import 'package:flutter_weather_app/presentation/bloc/weather_event.dart';
import 'package:flutter_weather_app/presentation/bloc/weather_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeatherUsecase _getCurrentWeatherUsecase;
  WeatherBloc(this._getCurrentWeatherUsecase) : super(WeatherEmpty()) {
    on<OnCityChanged>((event, emit) async {
      debugPrint("on city changed");
      final String cityName = event.cityName;
      emit(WeatherLoading());
      final result = await _getCurrentWeatherUsecase.execute(cityName);
      result.fold(
          (failure) => {
                if (failure is ServerFailure)
                  {emit(WeatherError(failure.message))}
                else if (failure is ConnectionFailure)
                  {emit(WeatherNoInternet(failure.message))}
              },
          (data) => {emit(WeatherData(data))});
    });
  }
}
