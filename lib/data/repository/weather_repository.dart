import 'dart:convert';

import 'package:weather_app/data/data_provider/weather_data_provider.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository({required this.weatherDataProvider});
  Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'London';
      final response = await weatherDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(response);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return WeatherModel.fromJson(response);
    } catch (e) {
      throw e.toString();
    }
  }
}
