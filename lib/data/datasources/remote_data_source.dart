import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_app/data/constants.dart';
import 'package:flutter_weather_app/data/exception.dart';
import 'package:flutter_weather_app/data/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/response.dart';

abstract class RemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    final response =
        await client.get(Uri.parse(Urls.currentWeatherByName(cityName)));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      throw ServerException(response.reasonPhrase);
    } else {
      debugPrint(response.body.toString());
      throw ServerException(null);
    }
  }
}
