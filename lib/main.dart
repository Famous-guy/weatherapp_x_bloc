import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/bloc_bloc.dart';
import 'package:weather_app/data/data_provider/weather_data_provider.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/presentation/screeens/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(
        weatherDataProvider: WeatherDataProvider(),
      ),
      child: BlocProvider(
        create: (context) => BlocBloc(context.read<WeatherRepository>()
            // WeatherRepository(
            //   weatherDataProvider: WeatherDataProvider(),
            // ),
            ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(useMaterial3: true),
          home: const WeatherScreen(),
        ),
      ),
    );
  }
}
