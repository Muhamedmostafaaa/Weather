import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String name;
  final String country;
 final String localTime;

  const Location(
      {required this.name, required this.country, required this.localTime});

  @override
  List<Object> get props => [name,country,localTime];
}