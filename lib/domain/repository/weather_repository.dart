import 'package:dartz/dartz.dart';
import 'package:weather/common/failure.dart';
import 'package:weather/domain/entity/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getWeather();
}
