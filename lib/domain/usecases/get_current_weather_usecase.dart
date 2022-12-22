import 'package:dartz/dartz.dart';

import '../../data/failure.dart';
import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class GetCurrentWeatherUsecase {
  final WeatherRepository repository;

  GetCurrentWeatherUsecase(this.repository);

  Future<Either<Failure, Weather>> execute(String cityName) {
    return repository.getCurrentWeather(cityName);
  }
}
