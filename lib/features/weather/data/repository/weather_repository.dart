import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/features/weather/data/data_source/base_weather_remote_datasource.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';
import 'package:weather_app/features/weather/domain/repository/base_weather_repository.dart';
import 'package:weather_app/features/weather/domain/use_cases/search_weather_usecase.dart';

import '../../../../core/error/failuer.dart';

class WeatherRepository extends BaseWeatherRepository{
  final BaseWeatherRemoteDataSource weatherRemoteDataSource;
  WeatherRepository(this.weatherRemoteDataSource);
  @override
  Future<Either<Failuer,Weather>> getWeather() async{
   final result = await  weatherRemoteDataSource.getWeather();
   try{

     return Right(result);

   }on ServerException catch(failuer){

     return left( ServerFailuer(erorrMessage: failuer.erorrModel.erorr.message));
   }

  }

  @override
  Future<Either<Failuer, Weather>> searchWesther(SearchWeatherPrameters parameter)async {
    final result= await weatherRemoteDataSource.searchWeather( parameter);

    try{
     return Right(result);
    }on ServerException
    catch(failuer){
      return Left(ServerFailuer(erorrMessage:failuer.erorrModel.erorr.message));
    }
  }


}