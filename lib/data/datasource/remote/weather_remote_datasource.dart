import 'package:injectable/injectable.dart';
import 'package:weather/common/constant.dart';
import 'package:weather/common/exception.dart';
import 'package:weather/data/models/weather_model.dart';
import 'package:dio/dio.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather();
}

@LazySingleton(as: WeatherRemoteDataSource)
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final Dio dio;

  WeatherRemoteDataSourceImpl({required this.dio});
  @override
  Future<WeatherModel> getWeather() async {
    final response =
        await dio.get("$BASE_URL?lat=-6.222&lon=106.81&appid=$API_KEY");

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
