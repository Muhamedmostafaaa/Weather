import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather/domain/entities/current.dart';
import 'package:weather_app/features/weather/domain/entities/forecast.dart';
import 'package:weather_app/features/weather/domain/entities/location.dart';

class Weather extends Equatable {
  final Location location;
  final Current current;
  final ForeCast forecast;

  const Weather(
      {required this.location, required this.current, required this.forecast});

  @override
  List<Object> get props => [location, current, forecast];

}