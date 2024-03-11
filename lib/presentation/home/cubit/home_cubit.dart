import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/domain/entity/weather_entity.dart';
import 'package:weather/domain/usecase/get_weather_usecase.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetWeatherUseCase _getWeatherUseCase;
  HomeCubit(this._getWeatherUseCase) : super(HomeInitial());

  void getWeather(double lat, double long) async {
    emit(HomeLoading());
    final result = await _getWeatherUseCase.execute();
    result.fold((l) async {
      emit(HomeError(l.message));
    }, (r) async {
      emit(HomeSuccess(r));
    });
  }
}
