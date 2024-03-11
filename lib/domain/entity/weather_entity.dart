import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final Coord coord;
  final List<WeatherElement> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Rain rain;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  const WeatherEntity({
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

  @override
  List<Object?> get props => [
        coord,
        weather,
        base,
        main,
        visibility,
        wind,
        rain,
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
  final int all;

  const Clouds({
    required this.all,
  });

  @override
  List<Object?> get props => [all];
}

class Coord extends Equatable {
  final double lon;
  final double lat;

  const Coord({
    required this.lon,
    required this.lat,
  });

  @override
  List<Object?> get props => [lon, lat];
}

class Main extends Equatable {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  const Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
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
  final double the1H;

  const Rain({
    required this.the1H,
  });

  @override
  List<Object?> get props => [the1H];
}

class Sys extends Equatable {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  const Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  @override
  List<Object?> get props => [type, id, country, sunrise, sunset];
}

class WeatherElement extends Equatable {
  final int id;
  final String main;
  final String description;
  final String icon;

  const WeatherElement({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  @override
  List<Object?> get props => [id, main, description, icon];
}

class Wind extends Equatable {
  final double speed;
  final int deg;
  final double gust;

  const Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  @override
  List<Object?> get props => [speed, deg, gust];
}
