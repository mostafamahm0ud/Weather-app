import 'package:flutter/material.dart';
import 'package:flutter_app_5/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherDate;
  String? cityName;

  set weatherDate(WeatherModel? weather) {
    _weatherDate = weather;
    notifyListeners();
  }

  WeatherModel? get weatherDate => _weatherDate;
}
