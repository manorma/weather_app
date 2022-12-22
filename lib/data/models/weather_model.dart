import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/data/models/response.dart';
import 'package:flutter_weather_app/domain/entities/weather.dart';

class WeatherModel extends Response {
  final String? cityName;
  final String? main;
  final String? description;
  final String? iconCode;
  final double? temperature;
  final int? pressure;
  final int? humidity;

  const WeatherModel(
      {this.cityName,
      this.humidity,
      this.description,
      this.iconCode,
      this.pressure,
      this.temperature,
      this.main});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        cityName: json['name'],
        main: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        iconCode: json['weather'][0]['icon'],
        temperature: json['main']['temp'],
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity'],
      );

  Map<String, dynamic> toJson() => {
        'weather': [
          {
            'main': main,
            'description': description,
            'icon': iconCode,
          },
        ],
        'main': {
          'temp': temperature,
          'pressure': pressure,
          'humidity': humidity,
        },
        'name': cityName,
      };

  Weather toEntity() => Weather(
      cityName: cityName,
      main: main,
      description: description,
      iconCode: iconCode,
      temperature: temperature,
      pressure: pressure,
      humidity: humidity);

  @override
  List<Object?> get props =>
      [cityName, main, description, iconCode, temperature, pressure, humidity];
}
