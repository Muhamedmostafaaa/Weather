import 'package:dartz/dartz.dart';
import 'package:weather_app/features/weather/domain/use_cases/search_weather_usecase.dart';

import '../../../../core/error/failuer.dart';
import '../entities/weather.dart';

abstract class BaseWeatherRepository{
  Future<Either<Failuer,Weather>>getWeather();
  Future<Either<Failuer,Weather>>searchWesther(SearchWeatherPrameters parameter);


}