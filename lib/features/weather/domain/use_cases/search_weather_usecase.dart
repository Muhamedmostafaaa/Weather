import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/error/failuer.dart';
import 'package:weather_app/core/usecase/base_usecase.dart';
import 'package:weather_app/features/weather/domain/repository/base_weather_repository.dart';

import '../entities/weather.dart';

class SeacrhWeatherUsecase extends BaseUseCase<Weather, SearchWeatherPrameters> {
  final BaseWeatherRepository baseWeatherRepository;

  SeacrhWeatherUsecase(this.baseWeatherRepository);

  @override
  Future<Either<Failuer, Weather>> call(SearchWeatherPrameters paramter) async {
    return await baseWeatherRepository.searchWesther(paramter);
  }


}

class SearchWeatherPrameters extends Equatable {
  final String city;

  const SearchWeatherPrameters({required this.city});

  @override
  List<Object> get props => [city];
}