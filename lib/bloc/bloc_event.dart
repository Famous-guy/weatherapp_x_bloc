part of 'bloc_bloc.dart';

@immutable
sealed class BlocEvent {}

final class WeatherFetched extends BlocEvent {}
