import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/utils/color_manager.dart';
import 'package:weather_app/features/weather/presentation/components/customscrollview_component.dart';
import 'package:weather_app/features/weather/presentation/components/drawer_component.dart';
import 'package:weather_app/features/weather/presentation/controller/weather_cubit.dart';
import '../../../../core/services/service_locator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final appKey = GlobalKey();
  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 200;

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (height - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    debugPrint('build');
    return
      BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            var cubit = BlocProvider.of<WeatherCubit>(context);
            if(cubit.weather==null){
              return 
                Scaffold(body: Center(child: CircularProgressIndicator()));
            }else if(cubit.weather!=null){
              return Scaffold(
                backgroundColor: AppColors.primaryLight,
                body: NestedScrollView(physics: BouncingScrollPhysics(),
                  controller: _scrollController,
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness:Brightness.light),
                        elevation: 0,
                        backgroundColor: AppColors.primaryLight,
                        pinned: false,
                        expandedHeight: 275,
                        flexibleSpace: FlexibleSpaceBar(
                          collapseMode: CollapseMode.parallax,
                          title: _isShrink
                              ? Text(
                            '',
                          )
                              : null,
                          background: SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 70,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${cubit.weather?.current.tempC.toInt()}°',
                                        style: TextStyle(
                                            fontSize: 55, color: Colors.white),
                                      ),
                                      Spacer(),
                                      Image.asset(
                                        'assets/images/sunny.png',
                                        height: 70,
                                      )
                                    ],
                                  ),
                                  
                                  Row(
                                    children: [
                                      Text(
                                        ' ${cubit.weather?.location.name}',
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.white),
                                        
                                      ),
                                      SizedBox(width: 5,),
                                      Icon(Icons.location_on,size: 25,)
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    '${cubit.weather?.forecast.forecastday[0].day.maxTempC.toInt()}°/ ${cubit.weather?.forecast.forecastday[0].day.minTempC.toInt()}° feels like ${cubit.weather?.current.feelslike.toInt()}°',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      ' ${DateFormat('EEEE').format(DateTime.parse(cubit.weather?.forecast.forecastday[0].date ?? ''))}, ${DateFormat('h:mm').format(DateTime.now())}pm',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: CustomScrollViewComponent(),
                ),
                drawer: DrawerComponent(),
              );
            }else{
              return Center(child: Text(cubit.errorMessage));
            }


          },
        );
  }
}

