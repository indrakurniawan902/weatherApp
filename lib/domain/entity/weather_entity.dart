import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class WeatherEntity extends Equatable {
  Coord? coord;
  List<WeatherElement>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherEntity({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  @override
  List<Object?> get props => [
        coord,
        weather,
        base,
        main,
        visibility,
        wind,
        clouds,
        dt,
        sys,
        timezone,
        id,
        name,
        coord
      ];
}

class Clouds extends Equatable {
  int? all;

  Clouds({
    this.all,
  });

  @override
  List<Object?> get props => [all];
}

class Coord extends Equatable {
  double? lon;
  double? lat;

  Coord({
    this.lon,
    this.lat,
  });

  @override
  List<Object?> get props => [lon, lat];
}

class Main extends Equatable {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  @override
  List<Object?> get props => [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        humidity,
      ];
}

class Rain extends Equatable {
  double? the1H;

  Rain({
    this.the1H,
  });

  @override
  List<Object?> get props => [the1H];
}

class Sys extends Equatable {
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  Sys({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  @override
  List<Object?> get props => [type, id, country, sunrise, sunset];
}

class WeatherElement extends Equatable {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherElement({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  @override
  List<Object?> get props => [id, main, description, icon];
}

class Wind extends Equatable {
  double? speed;
  int? deg;
  double? gust;

  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  @override
  List<Object?> get props => [speed, deg, gust];
}
