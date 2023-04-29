import 'package:flutter/material.dart';
import 'package:flutter_app_5/cubits/weather_cubit/weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../models/weather_model.dart';
import '../provider/weather_provider.dart';
import '../services/weather_services.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (data) {
              cityName = data;
              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: cityName!);
              BlocProvider.of<WeatherCubit>(context).cityName=cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              label: Text('Search'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 30, horizontal: 14),
              hintText: 'Enter a City',
              border: OutlineInputBorder(),
              suffixIcon: GestureDetector(
                  onTap: () async {
                    WeatherServices service = WeatherServices();
                    WeatherModel? weather =
                        await service.getWeather(cityName: cityName!);
                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherDate = weather;
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityName = cityName;
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search)),
            ),
          ),
        ),
      ),
    );
  }
}
