import 'package:weather_app/features/weather/domain/entities/current.dart';

class CurrentModel extends Current {
 const  CurrentModel(
      {required super.tempC,
      required super.condition,
      required super.windKph,
      required super.humidity,
      required super.uv,
        required super.feelslike
      });
  factory CurrentModel.fromJson(Map<String, dynamic> json) => CurrentModel(
      tempC: json['temp_c'],
      condition: ConditionModel.fromJson(json['condition']),
      windKph: json['wind_kph'],
      humidity: json['humidity'],
      uv: json['uv'],
      feelslike: json['feelslike_c']
  );
}

class ConditionModel extends Condition {
 const  ConditionModel({required super.text, required super.icon});
  factory ConditionModel.fromJson(Map<String, dynamic> json) =>
      ConditionModel(text: json['text'], icon: json['icon']);
}
