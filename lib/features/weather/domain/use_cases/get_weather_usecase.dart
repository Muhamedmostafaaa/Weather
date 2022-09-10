import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failuer.dart';
import 'package:weather_app/core/usecase/base_usecase.dart';
import 'package:weather_app/features/weather/domain/repository/base_weather_repository.dart';

import '../entities/weather.dart';

class GetWeatherUseCase extends BaseUseCase<Weather,NoParameter>{
  final BaseWeatherRepository baseWeatherRepository;
  GetWeatherUseCase(this.baseWeatherRepository);
  Future<Either<Failuer,Weather>>call(NoParameter parameter)async{
    return await baseWeatherRepository.getWeather();

  }


}