part of 'home_cubit.dart';

abstract class HomeState {
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final WeatherModel weather;
  HomeSuccess(this.weather);

  @override
  List<Object> get props => [weather];
}

class HomeError extends HomeState {
  final String error;
  HomeError(this.error);

  @override
  List<Object> get props => [error];
}
