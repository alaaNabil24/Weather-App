import 'package:weather_task/data/models/weather_data.dart';

class SearchModel {
  String? message;
  String? cod;
  int? count;
  List<ListCity>? listCity;

  SearchModel({this.message, this.cod, this.count, this.listCity});

  SearchModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    cod = json['cod'];
    count = json['count'];
    if (json['list'] != null) {
      listCity = <ListCity>[];
      json['list'].forEach((v) {
        listCity!.add( ListCity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['cod'] = this.cod;
    data['count'] = this.count;
    if (this.listCity != null) {
      data['list'] = this.listCity!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListCity {
  int? id;
  String? name;
  Coord? coord;

  Main? main;
  int? dt;

 dynamic rain;
  dynamic snow;

  List<Weather>? weather;

  ListCity(
      {this.id,
        this.name,
        this.coord,

        this.dt,

        this.main,
        this.rain,
        this.snow,

        this.weather});

  ListCity.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    name = json['name'];
    coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;


    main = json['main'] != null ? new Main.fromJson(json['main']) : null;
    dt = json['dt'];

    rain = json['rain'];
    snow = json['snow'];


    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(new Weather.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.coord != null) {
      data['coord'] = this.coord!.toJson();
    }

    data['dt'] = this.dt;

    data['rain'] = this.rain;
    data['snow'] = this.snow;

    if (this.weather != null) {
      data['weather'] = this.weather!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  Main(
      {this.temp,
        this.feelsLike,
        this.tempMin,
        this.tempMax,
        this.pressure,
        this.humidity,
        this.seaLevel,
        this.grndLevel});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
  }}
class Coord {
  double? lat;
  double? lon;

  Coord({this.lat, this.lon});

  Coord.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}




