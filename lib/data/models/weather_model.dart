import 'package:json_annotation/json_annotation.dart';
import 'package:weather/data/models/remote_response_mapper.dart';
import 'package:weather/domain/entity/weather_entity.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel implements ResponseMapper<WeatherEntity> {
  final CoordModel coord;
  final List<WeatherElementModel> weather;
  final String base;
  final MainModel main;
  final int visibility;
  final WindModel wind;
  final RainModel rain;
  final CloudsModel clouds;
  final int dt;
  final SysModel sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  WeatherModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.rain,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  @override
  WeatherEntity toDomain() {
    return WeatherEntity(
        coord: coord.toDomain(),
        weather: weather.map((e) => e.toDomain()).toList(),
        base: base,
        main: main.toDomain(),
        visibility: visibility,
        wind: wind.toDomain(),
        rain: rain.toDomain(),
        clouds: clouds.toDomain(),
        dt: dt,
        sys: sys.toDomain(),
        timezone: timezone,
        id: id,
        name: name,
        cod: cod);
  }
}

@JsonSerializable()
class CoordModel implements ResponseMapper<Coord> {
  final double lon;
  final double lat;

  const CoordModel({
    required this.lon,
    required this.lat,
  });

  factory CoordModel.fromJson(Map<String, dynamic> json) =>
      _$CoordModelFromJson(json);
  Map<String, dynamic> toJson() => _$CoordModelToJson(this);

  @override
  Coord toDomain() {
    return Coord(lon: lon, lat: lat);
  }
}

@JsonSerializable()
class WeatherElementModel implements ResponseMapper<WeatherElement> {
  final int id;
  final String main;
  final String description;
  final String icon;

  const WeatherElementModel({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherElementModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherElementModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherElementModelToJson(this);

  @override
  WeatherElement toDomain() {
    return WeatherElement(
        id: id, main: main, description: description, icon: icon);
  }
}

@JsonSerializable()
class MainModel implements ResponseMapper<Main> {
  final double temp;
  @JsonKey(name: 'feels_like')
  final double feelsLike;
  @JsonKey(name: 'temp_min')
  final double tempMin;
  @JsonKey(name: 'temp_max')
  final double tempMax;
  final int pressure;
  final int humidity;

  MainModel({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) =>
      _$MainModelFromJson(json);
  Map<String, dynamic> toJson() => _$MainModelToJson(this);

  @override
  Main toDomain() {
    return Main(
      temp: temp,
      feelsLike: feelsLike,
      tempMin: tempMin,
      tempMax: tempMax,
      pressure: pressure,
      humidity: humidity,
    );
  }
}

@JsonSerializable()
class WindModel implements ResponseMapper<Wind> {
  final double speed;
  final int deg;
  final double gust;

  const WindModel({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory WindModel.fromJson(Map<String, dynamic> json) =>
      _$WindModelFromJson(json);
  Map<String, dynamic> toJson() => _$WindModelToJson(this);

  @override
  Wind toDomain() {
    return Wind(speed: speed, deg: deg, gust: gust);
  }
}

@JsonSerializable()
class RainModel implements ResponseMapper<Rain> {
  @JsonKey(name: '1h')
  final double the1H;

  const RainModel({
    required this.the1H,
  });

  factory RainModel.fromJson(Map<String, dynamic> json) =>
      _$RainModelFromJson(json);
  Map<String, dynamic> toJson() => _$RainModelToJson(this);

  @override
  Rain toDomain() {
    return Rain(the1H: the1H);
  }
}

@JsonSerializable()
class CloudsModel implements ResponseMapper<Clouds> {
  final int all;

  const CloudsModel({
    required this.all,
  });

  factory CloudsModel.fromJson(Map<String, dynamic> json) =>
      _$CloudsModelFromJson(json);
  Map<String, dynamic> toJson() => _$CloudsModelToJson(this);

  @override
  Clouds toDomain() {
    return Clouds(all: all);
  }
}

@JsonSerializable()
class SysModel implements ResponseMapper<Sys> {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  const SysModel({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory SysModel.fromJson(Map<String, dynamic> json) =>
      _$SysModelFromJson(json);
  Map<String, dynamic> toJson() => _$SysModelToJson(this);

  @override
  Sys toDomain() {
    return Sys(
        type: type, id: id, country: country, sunrise: sunrise, sunset: sunset);
  }
}
