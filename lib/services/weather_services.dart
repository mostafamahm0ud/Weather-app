import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherServices {
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try {
      String baseUrl = 'http://api.weatherapi.com/v1';
      String apiKey = '8e0bcc73eefc49d6aa4222222230304';
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);
      // print(data);
      weather = WeatherModel.fromjson(data);
    } catch (e) {
    }
    return weather;
  }
}
