import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/domain/entities/weather.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
  @override
  List<Object?> get props => [];
}

class WeatherLoading extends WeatherState {}

class WeatherError extends WeatherState {
  final String message;
  const WeatherError(this.message);
  @override
  List<Object?> get props => [message];
}

class WeatherNoInternet extends WeatherState {
  final String message;
  const WeatherNoInternet(this.message);
  @override
  List<Object?> get props => [message];
}

class WeatherEmpty extends WeatherState {}

class WeatherData extends WeatherState {
  final Weather result;
  const WeatherData(this.result);
  @override
  List<Object?> get props => [result];
}
