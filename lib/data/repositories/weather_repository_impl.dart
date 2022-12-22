import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_app/data/datasources/remote_data_source.dart';
import 'package:flutter_weather_app/data/exception.dart';
import 'package:flutter_weather_app/domain/entities/weather.dart';
import 'package:flutter_weather_app/data/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final RemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName) async {
    try {
      final result = await remoteDataSource.getCurrentWeather(cityName);
      debugPrint(result.toString());
      return Right(result.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage ?? "Something went wrong"));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
