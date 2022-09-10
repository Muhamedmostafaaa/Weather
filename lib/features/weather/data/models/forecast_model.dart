import 'package:weather_app/features/weather/data/models/current_model.dart';
import 'package:weather_app/features/weather/domain/entities/forecast.dart';

class ForeCastModel extends ForeCast {
  ForeCastModel({required super.forecastday});
  factory ForeCastModel.fromJson(Map<String,dynamic>json)=>ForeCastModel
    (forecastday:List.from(json['forecastday'].map((e) => ForeCastDayModel.fromJson(e))) );
  
}

class ForeCastDayModel extends ForeCastDay {
  const ForeCastDayModel(
      {required super.date,
      required super.day,
      required super.astro,
      required super.hour});
  factory ForeCastDayModel.fromJson(Map<String, dynamic> json) =>
      ForeCastDayModel(
          date: json['date'],
          day: DayModel.fromJson(json['day']),
          astro: AstroModel.fromJson(json['astro']),
          hour: List.from(json['hour'].map((e) => HourModel.fromJson(e))));
}

class DayModel extends Day {
  const DayModel(
      {required super.maxTempC,
      required super.minTempC,
      required super.avgHumidity,
      required super.uv,
      required super.condition,
      required super.willItRain});
  factory DayModel.fromJson(Map<String, dynamic> json) => DayModel(
      maxTempC: json['maxtemp_c'],
      minTempC: json['mintemp_c'],
      avgHumidity: json['avghumidity'],
      uv: json['uv'],
      willItRain:json['daily_will_it_rain'],
      condition: ConditionModel.fromJson(json['condition']));
}

class AstroModel extends Astro {
  const AstroModel({required super.sunRise, required super.sunSet});
  factory AstroModel.fromJson(Map<String, dynamic> json) =>
      AstroModel(sunRise: json['sunrise'], sunSet: json['sunset']);
}

class HourModel extends Hour {
  HourModel(
      {required super.time,
      required super.tempC,
      required super.condition,
      required super.willItRain});
  factory HourModel.fromJson(Map<String, dynamic> json) => HourModel(
      time: json['time'],
      tempC: json['temp_c'],
      condition: ConditionModel.fromJson(json['condition']),
      willItRain: json['will_it_rain']);
}
