// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:hewa/service/secret.dart';
import 'package:http/http.dart' as http;


class Waiter {
  var key = Secret().apiKey;

  Future getData(cityName) async {
    print(cityName + " ok ");
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=ed7d1adb2fbe55c4606e7e48e8f6907f&units=metric');
    var res = await http.get(url);

    var decoBody = jsonDecode(res.body);
    // print(decoBody);

    if (res.statusCode == 200) {
      WeatherInfo weatherInfo = WeatherInfo(
          cityname: decoBody['name'],
          condition: decoBody['weather'][0]['main'],
          humidity: decoBody['main']['humidity'],
          icon: decoBody['weather'][0]['icon'],
          temp: decoBody['main']['temp'],
          feellike: decoBody['main']['feels_like'],
          wind: decoBody['wind']['speed']);
      return weatherInfo;
    } else {
      print('mmmh');
    }
  }
}

class WeatherInfo {
  final cityname, icon, condition, temp, wind, feellike, humidity;

  WeatherInfo(
      {required this.cityname,
      required this.condition,
      required this.humidity,
      required this.icon,
      required this.temp,
      required this.wind,
      required this.feellike});
}
