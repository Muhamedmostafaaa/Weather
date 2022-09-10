import 'package:get_it/get_it.dart';
import 'package:weather_app/core/usecase/base_usecase.dart';
import 'package:weather_app/features/weather/data/data_source/base_weather_remote_datasource.dart';
import 'package:weather_app/features/weather/data/repository/weather_repository.dart';
import 'package:weather_app/features/weather/domain/repository/base_weather_repository.dart';
import 'package:weather_app/features/weather/domain/use_cases/get_weather_usecase.dart';
import 'package:weather_app/features/weather/domain/use_cases/search_weather_usecase.dart';

final sl = GetIt.instance;
class ServiceLocator{
  void init(){

           ///USE CASES
    sl.registerLazySingleton(() =>GetWeatherUseCase(sl()));
    sl.registerLazySingleton(() =>SeacrhWeatherUsecase(sl()));

          /// REPOSITORY
    sl.registerLazySingleton<BaseWeatherRepository>(() => WeatherRepository(sl()));
       /// REMOTE DATASOURCE
    sl.registerLazySingleton<BaseWeatherRemoteDataSource>(() =>WeatherRemoteDataSource() );

  }



}