import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart' as location;
import 'package:location/location.dart%20';
import 'package:meta/meta.dart';
import 'package:weather_app/core/usecase/base_usecase.dart';
import 'package:weather_app/core/utils/enums.dart';
import 'package:geocoding/geocoding.dart' as gelocator;
import 'package:weather_app/features/weather/domain/entities/forecast_days.dart';
import 'package:weather_app/features/weather/domain/entities/forecast_hours_of_day.dart';
import 'package:weather_app/features/weather/domain/use_cases/search_weather_usecase.dart';

import '../../domain/entities/weather.dart';
import '../../domain/use_cases/get_weather_usecase.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUseCase getWeather;
  final SeacrhWeatherUsecase seacrhWeatherUseCase;
  WeatherCubit(this.getWeather, this.seacrhWeatherUseCase) : super(WeatherInitial());
  Weather? weather;
  String errorMessage = '';
  ThemeMode themeMode=ThemeMode.light;

  Location location = new Location();
   Weather? search;
   String searchMessage='';
  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  List<String> hoursOFday = [
    '12 am',
    '1 am',
    '2 am',
    '3 am',
    '4 am',
    '5 am',
    '6 am',
    '7 am',
    '8 am',
    '9 am',
    '10 am',
    '11 am',
    '12 pm',
    '1 pm',
    '2 pm',
    '3 pm',
    '4 pm',
    '5 pm',
    '6 pm',
    '7 pm',
    '8 pm',
    '9 pm',
    '10 pm',
    '11 pm',
  ];
  List<ForecastHoursOFDay> hourDayforecast = [];
  List<ForecastOfDays> daysForecast = [];

  RequestState weatherState = RequestState.loading;
  void fetchWeather() async {
    emit(WeatherLoadState());
    final result = await getWeather(NoParameter());
    result.fold((l) {
      errorMessage = l.erorrMessage;
      print('erroe');
      weatherState = RequestState.error;
      emit(WeatherErorrState());
    }, (r) {
      weather = r;

      print('done');
      weatherState = RequestState.loaded;
      emit(WeatherSuccessState());
    });
  }

  String getImageIcon(String time) {
    if (time == '6 pm' ||
        time == '7 pm' ||
        time == '8 pm' ||
        time == '9 pm' ||
        time == '10 pm' ||
        time == '11 pm' ||
        time == '12 am' ||
        time == '1 am' ||
        time == '2 am' ||
        time == '3 am' ||
        time == '4 am') {
      return 'assets/images/moon.png';
    } else {
      return 'assets/images/sun_logo.png';
    }
  }

  void getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    List<gelocator.Placemark> placemarks =
        await gelocator.placemarkFromCoordinates(
            _locationData!.latitude!.toDouble(),
            _locationData!.longitude!.toDouble());
    print(placemarks.toString());
    print(_locationData.toString());
  }

  void searchWeather(String city) async {
    emit(WeatherLoadState());
    final result = await seacrhWeatherUseCase.call(SearchWeatherPrameters(city: city));
    result.fold((l){
      errorMessage=l.erorrMessage;
      emit(WeatherErorrState());
    }, (r){
      search=r;
      emit(WeatherSuccessState());
    });
  }
  void toggeleTheme(){
    if(themeMode==ThemeMode.light){
      themeMode=ThemeMode.dark;
    }{
      themeMode=ThemeMode.light;
    }
  }
}
