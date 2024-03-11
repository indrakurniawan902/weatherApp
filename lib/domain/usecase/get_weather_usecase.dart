import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/common/failure.dart';
import 'package:weather/domain/entity/weather_entity.dart';
import 'package:weather/domain/repository/weather_repository.dart';

@lazySingleton
class GetWeatherUseCase {
  final WeatherRepository repository;

  GetWeatherUseCase(this.repository);

  Future<Either<Failure, WeatherEntity>> execute() {
    return repository.getWeather();
  }
}
