
import 'dart:convert';

import 'package:kooshy/Models/weather.dart';

import 'package:http/http.dart' as http;
// api https://api.openweathermap.org/data/2.5/weather?lat=23&lon=32&appid=1ab5e5b50cd31038fe5265dea5a1df86&units=metric&lang=vi
// api https://api.openweathermap.org/data/2.5/weather?lat=100&lon=100&appid=1ab5e5b50cd31038fe5265dea5a1df86&units=metric&lang=vi
// api call all: https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&exclude=minutely,daily,alerts&appid=1ab5e5b50cd31038fe5265dea5a1df86&lang=vi
const baseUrl = "https://api.openweathermap.org/data/2.5/weather?";
const baseUrlAll = 'https://api.openweathermap.org/data/2.5/onecall?';
const appid = "1ab5e5b50cd31038fe5265dea5a1df86";
//late final LoctionUrl  = (lat,long,lang) => "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$appid&units=metric&lang=$lang";
late final LoctionUrl  = (lat,long,lang) => "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$long&exclude=minutely,daily,alerts&appid=$appid&units=metric&lang=$lang";

class WeatherRepositories {
  late final http.Client httpClient;

  WeatherRepositories({required this.httpClient});

  Future<WeatherMain> fetchWeather ( String lat, long, lang) async{
    final response = await httpClient.get(Uri.parse(LoctionUrl(lat,long,lang)));
    print("check repornt ${response.statusCode} and/ ${Uri.parse(LoctionUrl(lat,long,lang).toString())}");
    if(response.statusCode !=200){
      print("lôi call api");
      throw Exception("lỗi lấy thời tiết - WeatherRepositories");
    }else{
      final weatherJson = jsonDecode(response.body);
      print("call api thanh cong");
      return WeatherMain.fromJson(weatherJson);
    }
  }
}
