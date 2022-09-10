import 'package:weather_app/features/weather/domain/entities/location.dart';

class LocationModel extends Location {
  LocationModel(
      {required super.name, required super.country, required super.localTime});
  factory LocationModel.fromJson(Map<String,dynamic>json)=>LocationModel
    (name: json['name'], country: json['country'], localTime: json['localtime']);
}
