import 'package:json_annotation/json_annotation.dart';
import 'package:weather/data/models/remote_response_mapper.dart';
import 'package:weather/domain/entity/weather_entity.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel implements ResponseMapper<WeatherEntity> {
  CoordModel? coord;
  List<WeatherElementModel>? weather;
  String? base;
  MainModel? main;
  int? visibility;
  WindModel? wind;
  CloudsModel? clouds;
  int? dt;
  SysModel? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherModel({
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

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String?, dynamic> toJson() => _$WeatherModelToJson(this);

  @override
  WeatherEntity toDomain() {
    return WeatherEntity(
        coord: coord?.toDomain(),
        weather: weather?.map((e) => e.toDomain()).toList(),
        base: base,
        main: main?.toDomain(),
        visibility: visibility,
        wind: wind?.toDomain(),
        clouds: clouds?.toDomain(),
        dt: dt,
        sys: sys?.toDomain(),
        timezone: timezone,
        id: id,
        name: name,
        cod: cod);
  }
}

@JsonSerializable()
class CoordModel implements ResponseMapper<Coord> {
  double? lon;
  double? lat;

  CoordModel({
    this.lon,
    this.lat,
  });

  factory CoordModel.fromJson(Map<String, dynamic> json) =>
      _$CoordModelFromJson(json);
  Map<String?, dynamic> toJson() => _$CoordModelToJson(this);

  @override
  Coord toDomain() {
    return Coord(lon: lon, lat: lat);
  }
}

@JsonSerializable()
class WeatherElementModel implements ResponseMapper<WeatherElement> {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherElementModel({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherElementModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherElementModelFromJson(json);
  Map<String?, dynamic> toJson() => _$WeatherElementModelToJson(this);

  @override
  WeatherElement toDomain() {
    return WeatherElement(
        id: id, main: main, description: description, icon: icon);
  }
}

@JsonSerializable()
class MainModel implements ResponseMapper<Main> {
  double? temp;
  @JsonKey(name: 'feels_like')
  double? feelsLike;
  @JsonKey(name: 'temp_min')
  double? tempMin;
  @JsonKey(name: 'temp_max')
  double? tempMax;
  int? pressure;
  int? humidity;

  MainModel({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) =>
      _$MainModelFromJson(json);
  Map<String?, dynamic> toJson() => _$MainModelToJson(this);

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
  double? speed;
  int? deg;
  double? gust;

  WindModel({
    this.speed,
    this.deg,
    this.gust,
  });

  factory WindModel.fromJson(Map<String, dynamic> json) =>
      _$WindModelFromJson(json);
  Map<String?, dynamic> toJson() => _$WindModelToJson(this);

  @override
  Wind toDomain() {
    return Wind(speed: speed, deg: deg, gust: gust);
  }
}

@JsonSerializable()
class CloudsModel implements ResponseMapper<Clouds> {
  int? all;

  CloudsModel({
    this.all,
  });

  factory CloudsModel.fromJson(Map<String, dynamic> json) =>
      _$CloudsModelFromJson(json);
  Map<String?, dynamic> toJson() => _$CloudsModelToJson(this);

  @override
  Clouds toDomain() {
    return Clouds(all: all);
  }
}

@JsonSerializable()
class SysModel implements ResponseMapper<Sys> {
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  SysModel({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory SysModel.fromJson(Map<String, dynamic> json) =>
      _$SysModelFromJson(json);
  Map<String?, dynamic> toJson() => _$SysModelToJson(this);

  @override
  Sys toDomain() {
    return Sys(
        type: type, id: id, country: country, sunrise: sunrise, sunset: sunset);
  }
}
