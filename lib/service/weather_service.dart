import 'package:dio/dio.dart';
import 'package:weather/model/weather_model.dart';

class WeatherService {
  static Future<WeatherModel> getWeather(double lat, double long) async {
    final dio = Dio();
    const String apiKey = "c66ff6cc61c785583a56e1212c4a0101";
    WeatherModel data = WeatherModel();
    try {
      final response = await dio.get(
          "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey");
      data = WeatherModel.fromJson(response.data);
      return data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
