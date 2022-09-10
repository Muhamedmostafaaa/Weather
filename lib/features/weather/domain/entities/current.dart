import 'package:equatable/equatable.dart';

class Current extends Equatable {
  final double tempC;
  final Condition condition;
  final double windKph;
  final int humidity;
  final double uv;
  final double feelslike;

  const Current({required this.tempC,
    required this.condition,
    required this.windKph,
    required this.humidity,
    required this.uv,
    required this.feelslike
  });

  @override
  List<Object> get props => [tempC, condition, windKph, humidity, uv,feelslike];
}

class Condition extends Equatable {
  final String text;
  final String icon;

  const Condition({required this.text, required this.icon});

  @override
  List<Object> get props => [text, icon];
}
