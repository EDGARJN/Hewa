import 'package:flutter/material.dart';
import 'package:hewa/models/usefulWidget.dart';
import 'package:hewa/screen/loading.dart';
import 'package:hewa/service/waiter.dart';
import 'package:hewa/styles/decorColor.dart';
import 'package:intl/intl.dart';

class RealHome extends StatefulWidget {
  String? data;
  RealHome({super.key, this.data});

  @override
  State<RealHome> createState() => _RealHomeState();
}

class _RealHomeState extends State<RealHome> {
  @override
  Widget build(BuildContext context) {

    String? city = 'Dar es salaam';
    widget.data != null ? city = widget.data : city;

    // media query dimension for app responsive
    double heights = MediaQuery.of(context).size.height;
    double widths = MediaQuery.of(context).size.width;

    // main widget
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor().mainColor,
          elevation: 0.0,
        ),
        backgroundColor: AppColor().mainColor,
        body: FutureBuilder(
            future: Waiter().getData(city),
            builder: (context, AsyncSnapshot snapshot) {


              if (snapshot.hasData) { // Check if there is data in our API
                return Container(
                  height: heights,
                  width: widths,
                  
                  decoration:const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                                  colors:[
                                    Color(0xfff005C97),
                                    Color(0xfff1F4696)
                                  ] ),
                    
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        height: heights,
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DupliWidget().txt('Hewa', 27.0),
                                Icon(
                                  Icons.circle,
                                  color: AppColor().iconColor,
                                  size: 10,
                                )
                              ],
                            ),
                            SizedBox(
                              height: heights * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColor().iconColor,
                                  size: 20,
                                ),
                                DupliWidget().txt(snapshot.data.cityname, 25.0)
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                    image: NetworkImage(
                                        'http://openweathermap.org/img/wn/${snapshot.data.icon}@2x.png')),
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 30.0),
                                      child: DupliWidget()
                                          .txt('${snapshot.data.temp}', 90.0),
                                    ),
                                    DupliWidget().txt('°C', 30.0),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  DupliWidget().txt(
                                    'Feels Like  ',
                                    15.0),
                                    Text('${snapshot.data.feellike} °C', style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: AppColor().iconColor),)
                                ],),
                                DupliWidget().txt(snapshot.data.condition, 15.0)
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          height: heights * 0.35,
                          right: 0,
                          left: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              // 'background: linear-gradient(180deg, #005C97 0%, #1F4696 100%);
                                gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      colors:[
                        AppColor().mainColor,
                        AppColor().submainCol
                      ] ),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.elliptical(900.0, 120.0),
                                    topLeft: Radius.elliptical(1500.0, 520.0))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.wind_power,
                                        color: AppColor().textColor,
                                      ),
                                      DupliWidget().txt('  Windspeed', 15.0),
                                      Spacer(),
                                      DupliWidget().txt(
                                          ' ${(snapshot.data.wind * 3.6).roundToDouble()} km/h',
                                          15.0)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0, top: 15.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        color: AppColor().textColor,
                                      ),
                                      DupliWidget().txt(
                                          DateFormat.yMMMEd()
                                              .format(DateTime.now()),
                                          15.0),
                                      Spacer(),
                                      DupliWidget().txt(
                                          DateFormat.Hm()
                                              .format(DateTime.now()),
                                          15.0)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0, top: 25.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.water,
                                        color: AppColor().textColor,
                                      ),
                                      DupliWidget().txt('  Humidity', 15.0),
                                      Spacer(),
                                      DupliWidget().txt(
                                          ' ${snapshot.data.humidity} %', 15.0)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadScreen();
              } else if (snapshot.error == null) {
                return Center(
                  child: DupliWidget().txt('Wrong City Name !!', 10.0),
                );
              } else {
                return Text('${snapshot.error}');
              }
            }));
  }
}
