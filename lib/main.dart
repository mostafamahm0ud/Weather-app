import 'package:flutter/material.dart';
import 'package:flutter_app_5/cubits/weather_cubit/weather_cubit.dart';
import 'package:flutter_app_5/models/weather_model.dart';
import 'package:flutter_app_5/pages/home_page.dart';
import 'package:flutter_app_5/provider/weather_provider.dart';
import 'package:flutter_app_5/services/weather_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherServices());
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
