class WeatherModel {
  String date;
  String icon;
  double temp;
  double maxtemp;
  double mintemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.icon,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.weatherStateName});

  factory WeatherModel.fromjson(dynamic data) {
    var jsonDate = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: data['location']['localtime'],
        icon: jsonDate['condition']['icon'],
        temp: jsonDate['avgtemp_c'],
        maxtemp: jsonDate['maxtemp_c'],
        mintemp: jsonDate['mintemp_c'],
        weatherStateName: jsonDate['condition']['text']);
    // date = data['location']['localtime'];
    // icon = jsonDate['condition']['icon'];
    // temp = jsonDate['avgtemp_c'];
    // maxtemp = jsonDate['maxtemp_c'];
    // mintemp = jsonDate['mintemp_c'];
    // weatherStateName = jsonDate['condition']['text'];
  }
  @override
  String toString() {
    return 'temp= $temp date= $date ';
  }
}
