import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_5/cubits/weather_cubit/weather_cubit.dart';
import 'package:flutter_app_5/cubits/weather_cubit/weather_state.dart';
import 'package:flutter_app_5/pages/search_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../models/weather_model.dart';
import '../provider/weather_provider.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchPage();
                    },
                  ),
                );
              },
              icon: Icon(Icons.search),
            ),
          ],
          title: Text('Weather App'),
        ),
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, State) {
            if (State is WeatherLoding) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (State is WeatherSuccess) {
              weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
              return SuccessBody(weatherData: weatherData);
            } else if (State is WeatherFailure) {
              return Center(
                child: Text('Somthing Went Wrong!🙂'),
              );
            } else {
              return DefualtBody();
            }
          },
        ));
  }
}

class DefualtBody extends StatelessWidget {
  const DefualtBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          'There is no wether😞 start',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        Text(
          'Searcjing now 🔍',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ]),
    );
  }
}

class SuccessBody extends StatelessWidget {
  const SuccessBody({
    super.key,
    required this.weatherData,
  });

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 3,
          ),
          Text(
            BlocProvider.of<WeatherCubit>(context).cityName!,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Update at: ${weatherData!.date}',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network('${weatherData!.icon}'),
              Text(
                weatherData!.temp.toInt().toString(),
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text('maxTemp: ${weatherData!.maxtemp.toInt()}'),
                  Text('minTemp: ${weatherData!.mintemp.toInt()}'),
                ],
              )
            ],
          ),
          Spacer(),
          Text(
            weatherData!.weatherStateName,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
