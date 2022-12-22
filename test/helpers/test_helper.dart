import 'dart:io';

import 'package:flutter_weather_app/data/datasources/remote_data_source.dart';
import 'package:flutter_weather_app/domain/repositories/weather_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  WeatherRepository,
  RemoteDataSource,
], customMocks: [
  MockSpec<HttpClient>(as: #MockHttpClient)
])
void main() {}
