import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/models/weather_model.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocBloc extends Bloc<BlocEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  BlocBloc(
    this.weatherRepository,
  ) : super(WeatherInitial()) {
    on<WeatherFetched>(getCurrentWeather);
  }
  Future<void> getCurrentWeather(
      WeatherFetched event, Emitter<WeatherState> emit) async {
    emit(
      WeatherLoading(),
    );
    try {
      final weather = await weatherRepository.getCurrentWeather();
      // emit
      emit(
        WeatherSuccess(
          weatherModel: weather,
        ),
      );
    } catch (e) {
      emit(
        WeatherFailure(
          e.toString(),
        ),
      );
      print(e);
    }
  }
}
