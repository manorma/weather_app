import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  const Weather({
    this.cityName,
    this.main,
    this.description,
    this.iconCode,
    this.temperature,
    this.pressure,
    this.humidity,
  });

  final String? cityName;
  final String? main;
  final String? description;
  final String? iconCode;
  final double? temperature;
  final int? pressure;
  final int? humidity;
  @override
  List<Object?> get props => [
        cityName,
        main,
        description,
        iconCode,
        temperature,
        pressure,
        humidity,
      ];
}
