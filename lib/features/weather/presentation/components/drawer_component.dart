import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:weather_app/features/weather/presentation/controller/weather_cubit.dart';

import '../../../../core/utils/color_manager.dart';

class DrawerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
      var cubit = BlocProvider.of<WeatherCubit>(context);
      TextEditingController controller = TextEditingController();
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0)),
          child: Drawer(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              color: AppColors.drawerColor,
              child: Column(
                children: [
                   Align(
                      alignment: Alignment.topRight,
                      child: InkWell(onTap: (){
                        cubit.toggeleTheme();
                      },
                          child: Icon(Icons.settings))),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: const [
                      Icon(Icons.favorite),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Favoriteslocation ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                      Spacer(),
                      Icon(
                        Icons.info_outline,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 35,
                      ),
                      const Icon(
                        Icons.location_on,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '${cubit.weather?.location.name}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/images/sun.png',
                        height: 40,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '${cubit.weather?.current.tempC.toInt()}°',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Dash(
                      direction: Axis.horizontal,
                      length: 260,
                      dashLength: 3,
                      dashColor: Colors.white),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: const [
                      Icon(Icons.location_on),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Other Locations ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 45,
                      ),
                      Text(
                        '${cubit.search?.location.name??'Giza'}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/images/sun.png',
                        height: 40,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '${cubit.search?.current.tempC.toInt() ?? 34.toInt()}°',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 500,
                                color: AppColors.drawerColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Container(height: 50,
                                        child: TextFormField(style: TextStyle(color: Colors.white),
                                          controller: controller,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(



                                            hintStyle: TextStyle(color: Colors.white,fontSize: 18),
                                            fillColor: Colors.blueGrey,
                                            filled: true,
                                            prefixIcon: Icon(
                                              Icons.search,
                                              color: Colors.white,
                                            ),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white, width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white, width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white, width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Container
                                        (color: Colors.blueGrey,
                                        width: double.infinity,height: 50,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              cubit.searchWeather(controller.text);
                                              Navigator.pop(context);
                                            },
                                            child: Text('Search',style: TextStyle(fontSize: 18),),
                                          style:ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blueGrey,
                                            shape:RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(25), // <-- Radius
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Center(
                          child: Text(
                        'Manage Locations',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Dash(
                      direction: Axis.horizontal,
                      length: 260,
                      dashLength: 3,
                      dashColor: Colors.white),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: const [
                      Icon(Icons.info_rounded),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Report wrong locations ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Icon(Icons.headset_mic),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Contact US',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
