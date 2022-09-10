import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/local/cache_helper.dart';
import 'package:weather_app/core/network/diohelper.dart';
import 'package:weather_app/core/services/service_locator.dart';
import 'package:weather_app/features/weather/presentation/controller/weather_cubit.dart';
import 'package:weather_app/features/weather/presentation/screens/main_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  CacheHelper.init();
  ServiceLocator().init();
  DioHelper();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initliaze();
  }

  void initliaze() async {
    await Future.delayed(Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(sl(), sl())
        ..fetchWeather()
        ..getLocation(),
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (conetxt, state) {
          var cubit = BlocProvider.of<WeatherCubit>(conetxt);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: cubit.themeMode,
            theme: ThemeData(
              iconTheme: IconThemeData(color: Colors.white),
            ),
            home: MainScreen(),
          );
        },
      ),
    );
  }
}
