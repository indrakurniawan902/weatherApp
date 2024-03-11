import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/common/exception.dart';
import 'package:weather/common/failure.dart';
import 'package:weather/data/datasource/remote/weather_remote_datasource.dart';
import 'package:weather/domain/entity/weather_entity.dart';
import 'package:weather/domain/repository/weather_repository.dart';

@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, WeatherEntity>> getWeather() async {
    try {
      final result = await remoteDataSource.getWeather();
      return Right(result.toDomain());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
