import 'dart:convert';

import 'package:weatherapp/api/api_key.dart';

import '../model/weather_class.dart';
import 'package:http/http.dart' as http;

class FetchWeatherData {
  Future<WeatherData> getWeatherData(lat, lon) async {
    final response = await http.get(
      Uri.parse(
        apiUrl(lat, lon),
      ),
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return WeatherData.fromJson(data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

String apiUrl(var lat, var lon) {
  String url =
      'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric&exclude=minutely';
  return url;
}
