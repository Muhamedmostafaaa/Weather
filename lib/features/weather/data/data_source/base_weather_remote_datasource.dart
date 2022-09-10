import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/core/network/api_constants.dart';
import 'package:weather_app/core/network/diohelper.dart';
import 'package:weather_app/core/network/erorr_model.dart';
import 'package:weather_app/features/weather/domain/use_cases/search_weather_usecase.dart';

import '../models/weather_model.dart';

abstract class BaseWeatherRemoteDataSource {
  Future<WeatherModel> getWeather();
  Future<WeatherModel> searchWeather(SearchWeatherPrameters paramter);
}

class WeatherRemoteDataSource extends BaseWeatherRemoteDataSource {
  @override
  Future<WeatherModel> getWeather() async {
    final response = await DioHelper.getData(
        path: ApiConstants.foreCast,
        query: {
          'q': 'Nasr City',
          'days': 6,
          'key': '45fddcd4a73b4a928e0114624220409'
        });
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.data);
    } else {
      throw ServerException(erorrModel: ErorrModel.fromJson(response.data));
    }
  }

  @override
  Future<WeatherModel> searchWeather(SearchWeatherPrameters paramter) async {
    final response = await DioHelper.getData(
        path: ApiConstants.foreCast,
        query: {
          'q': paramter.city,
          'days': 6,
          'key': '45fddcd4a73b4a928e0114624220409'
        });
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.data);
    } else {
      throw ServerException(erorrModel: ErorrModel.fromJson(response.data));
    }
  }
}
