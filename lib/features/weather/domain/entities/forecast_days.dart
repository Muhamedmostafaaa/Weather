import 'package:equatable/equatable.dart';

class ForecastOfDays extends Equatable {
  final String day;
  final String willItRain;
  final String maxTemp;
  final String minTemp;

  const ForecastOfDays({required this.day,
    required this.willItRain,
    required this.maxTemp,
    required this.minTemp});

  @override
  List<Object> get props => [day, willItRain, maxTemp, minTemp];
}
