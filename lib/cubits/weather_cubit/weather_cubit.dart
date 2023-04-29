import 'package:flutter_app_5/cubits/weather_cubit/weather_state.dart';
import 'package:flutter_app_5/models/weather_model.dart';
import 'package:flutter_app_5/services/weather_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherServices weatherService;
  String? cityName;
  WeatherModel? weatherModel;

  WeatherCubit(this.weatherService) : super(WeatherInitial());
  void getWeather({required String cityName}) async {
    emit(WeatherLoding());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherLoding());
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
