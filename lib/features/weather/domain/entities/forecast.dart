import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather/domain/entities/current.dart';

class ForeCast extends Equatable {
  final List<ForeCastDay> forecastday;

  const ForeCast({required this.forecastday});

  @override
  List<Object> get props => [forecastday];
}

class ForeCastDay extends Equatable {
  final String date;
  final Day day;
  final Astro astro;
  final List<Hour> hour;


  const ForeCastDay({required this.date,
    required this.day,
    required this.astro,
    required this.hour});

  @override
  List<Object> get props => [date, day, astro, hour];
}

class Day extends Equatable {
  final double maxTempC;
  final double minTempC;
  final double avgHumidity;
  final double uv;
  final Condition condition;
  final int willItRain;

  const Day({required this.maxTempC,
    required this.minTempC,
    required this.avgHumidity,
    required this.uv,
    required this.condition,
  required this.willItRain});

  @override
  List<Object> get props =>
      [
        maxTempC,
        minTempC,
        avgHumidity,
        uv,
        condition,
        willItRain
      ];
}

class Astro extends Equatable {
  final String sunRise;
  final String sunSet;

  const Astro({required this.sunRise, required this.sunSet});

  @override
  List<Object> get props => [sunRise, sunSet];
}

class Hour extends Equatable {
  final String time;
  final double tempC;
  final Condition condition;
  final int willItRain;

  const Hour({required this.time,
    required this.tempC,
    required this.condition,
    required this.willItRain});

  @override
  List<Object> get props => [time, tempC, condition, willItRain];
}
