part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}
class WeatherLoadState extends WeatherState {}
class WeatherSuccessState extends WeatherState {}
class WeatherErorrState extends WeatherState {}

