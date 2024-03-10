import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/service/weather_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void getWeather(double lat, double long) async {
    emit(HomeLoading());
    try {
      final data = await WeatherService.getWeather(lat, long);
      emit(HomeSuccess(data));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
