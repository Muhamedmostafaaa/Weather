import 'package:equatable/equatable.dart';

class ForecastHoursOFDay extends Equatable {
  final String time;
  final String temp;
  final String willItRain;
  final String iconImage;

  const ForecastHoursOFDay(
      {required this.time, required this.temp, required this.willItRain,required this.iconImage});

  @override
  List<Object> get props => [time, temp, willItRain,iconImage];
}