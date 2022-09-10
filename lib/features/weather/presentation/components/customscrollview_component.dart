import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/weather/presentation/controller/weather_cubit.dart';

import '../../../../core/utils/color_manager.dart';

class CustomScrollViewComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<WeatherCubit>(context);
        return CustomScrollView(
          slivers: [
            SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  color: AppColors.primaryLight,
                  child: Column(
                    children: [
                      Container(
                          height: 200,
                          width: double.infinity,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              color: AppColors.secondryLight,
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: ListView.separated(
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            cubit.hoursOFday[index],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Image.asset(
                                            cubit.getImageIcon(
                                                cubit.hoursOFday[index]),
                                            height: 25,
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            '${cubit.weather?.forecast.forecastday[0].hour[index].tempC.toInt() ?? '2'}°',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                          Spacer(),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.water_drop,
                                                size: 12,
                                                color: Colors.white54,
                                              ),
                                              Text(
                                                '${cubit.weather?.forecast.forecastday[0].hour[index].willItRain ?? '8'}%',
                                                style: TextStyle(
                                                    color: Colors.white54),
                                              )
                                            ],
                                          )
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        width: 20,
                                      );
                                    },
                                    itemCount: cubit.weather?.forecast
                                            .forecastday[0].hour.length ??
                                        24),
                              ))),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                          height: 120,
                          width: double.infinity,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              color: AppColors.secondryLight,
                              elevation: 5,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    'Todays temp',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    ' Exceptect to be ${cubit.weather?.current.condition.text}',
                                    style: TextStyle(
                                        color: Colors.white54, fontSize: 18),
                                  )
                                ],
                              ))),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                          height: 300,
                          width: double.infinity,
                          child: Card(
                            color: AppColors.secondryLight,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: 85,
                                          child: Text(
                                            '${DateFormat('EEEE').format(DateTime.parse(cubit.weather?.forecast.forecastday[index].date ?? ''))}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        Text(
                                            '${cubit.weather?.forecast.forecastday[index].day.willItRain}%',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400)),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Image.asset(
                                          'assets/images/sun.png',
                                          height: 40,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Image.asset(
                                          'assets/images/moon.png',
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                            '${cubit.weather?.forecast.forecastday[index].day.maxTempC.toInt()}°   ${cubit.weather?.forecast.forecastday[index].day.minTempC.toInt()}° ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400))
                                      ],
                                    );
                                  },
                                  separatorBuilder: (conetxt, state) {
                                    return const SizedBox(
                                      height: 7,
                                    );
                                  },
                                  itemCount: cubit.weather?.forecast.forecastday
                                          .length ??
                                      10),
                            ),
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                          height: 180,
                          width: double.infinity,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: AppColors.secondryLight,
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        const Text(
                                          'SunRise',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          ' ${cubit.weather?.forecast.forecastday[0].astro.sunRise}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        Container(
                                            height: 100,
                                            child: Image.asset(
                                                'assets/images/sunrise.png'))
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        const Text(
                                          'SunSet',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          ' ${cubit.weather?.forecast.forecastday[0].astro.sunSet}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        Container(
                                            height: 100,
                                            child: Image.asset(
                                                'assets/images/sunset.png'))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                          height: 150,
                          width: double.infinity,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: AppColors.secondryLight,
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                            height: 35,
                                            child: Image.asset(
                                                'assets/images/sun_logo.png')),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'UV index',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          'High',
                                          style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 70,
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                            height: 35,
                                            child: Image.asset(
                                                'assets/images/wind_logo.png')),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'Wind',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${cubit.weather?.current.windKph.toInt()}km/h',
                                          style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 70,
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                            height: 35,
                                            child: Image.asset(
                                                'assets/images/humidity_logo.png')),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'Humidity',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${cubit.weather?.current.humidity.toInt()}%',
                                          style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ))
          ],
        );
      },
    );
  }
}
