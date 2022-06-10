import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

// class Autogenerated extends Equatable {
//   Coord? coord; // vị trí ( lat, long)
//   List<Weather>? weather; // thời tiết,
//   String? base; //Tham số nội bộ
//   Main? main; // các thông số chi tiết khác như nhiệt độ, độ ẩm ...
//   int? visibility; //Tầm nhìn, đồng hồ đo
//   Wind? wind; //gió
//   Clouds? clouds; // % mây
//   int? dt; //Thời gian tính toán dữ liệu, unix, UTC
//   Sys? sys; // mã quốc gia, thời gian măt trời lặn và mọc
//   int? timezone; //Thay đổi trong vài giây từ UTC
//   int? id; //ID thành phố
//   String? name; // tên thanh phố
//   int? cod; // Tham số nội bộ
//
//   Autogenerated(
//       {this.coord,
//       this.weather,
//       this.base,
//       this.main,
//       this.visibility,
//       this.wind,
//       this.clouds,
//       this.dt,
//       this.sys,
//       this.timezone,
//       this.id,
//       this.name,
//       this.cod});
//
//   // chuyển json sang đối tuong weather
//   factory Autogenerated.fromJson(dynamic json) {
//     if (json == null) {
//       return Autogenerated();
//     } else {
//       return Autogenerated(
//           coord: Coord.fromJson(json['coord']),
//           weather: (json['weather'] as List)
//               .map((e) => Weather.fromJson(e))
//               .toList(),
//           base: json['base'],
//           main: Main.fromJson(json['main']),
//           visibility: json['visibility'],
//           wind: Wind.fromJson(json['wind']),
//           clouds: Clouds.fromJson(json['clouds']),
//           dt: json['dt'],
//           sys: Sys.fromJson(json['sys']),
//           timezone: json['timezone'],
//           id: json['id'],
//           name: json['name'],
//           cod: json['cod']);
//     }
//     // coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
//     // if (json['weather'] != null) {
//     //   weather = <Weather>[];
//     //   json['weather'].forEach((v) {
//     //     weather!.add(new Weather.fromJson(v));
//     //   });
//     // }
//     // base = json['base'];
//     // main = json['main'] != null ? new Main.fromJson(json['main']) : null;
//     // visibility = json['visibility'];
//     // wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
//     // clouds =
//     //     json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null;
//     // dt = json['dt'];
//     // sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
//     // timezone = json['timezone'];
//     // id = json['id'];
//     // name = json['name'];
//     // cod = json['cod'];
//   }
//
//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   if (this.coord != null) {
//   //     data['coord'] = this.coord!.toJson();
//   //   }
//   //   if (this.weather != null) {
//   //     data['weather'] = this.weather!.map((v) => v.toJson()).toList();
//   //   }
//   //   data['base'] = this.base;
//   //   if (this.main != null) {
//   //     data['main'] = this.main!.toJson();
//   //   }
//   //   data['visibility'] = this.visibility;
//   //   if (this.wind != null) {
//   //     data['wind'] = this.wind!.toJson();
//   //   }
//   //   if (this.clouds != null) {
//   //     data['clouds'] = this.clouds!.toJson();
//   //   }
//   //   data['dt'] = this.dt;
//   //   if (this.sys != null) {
//   //     data['sys'] = this.sys!.toJson();
//   //   }
//   //   data['timezone'] = this.timezone;
//   //   data['id'] = this.id;
//   //   data['name'] = this.name;
//   //   data['cod'] = this.cod;
//   //   return data;
//   // }
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [
//         coord,
//         weather,
//         base,
//         main,
//         visibility,
//         wind,
//         clouds,
//         dt,
//         sys,
//         timezone,
//         id,
//         name,
//         cod
//       ];
// }
//
// class Coord {
//   double? lon;
//   double? lat;
//
//   Coord({this.lon, this.lat});
//
//   factory Coord.fromJson(dynamic json) {
//     if (json == null) {
//       return Coord();
//     } else {
//       return Coord(lon: json['lat'], lat: json['lat']);
//     }
//     // lon = json['lon'];
//     // lat = json['lat'];
//   }
//   //
//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['lon'] = this.lon;
//   //   data['lat'] = this.lat;
//   //   return data;
//   // }
// }
//
// class Weather {
//   int? id;
//   String? main;
//   String? description;
//   String? icon;
//
//   Weather({this.id, this.main, this.description, this.icon});
//
//   factory Weather.fromJson(dynamic json) {
//     if (json == null) {
//       return Weather();
//     } else {
//       return Weather(
//           id: json['id'],
//           main: json['main'],
//           description: json['description'],
//           icon: json['icon']);
//     }
//     // id = json['id'];
//     // main = json['main'];
//     // description = json['description'];
//     // icon = json['icon'];
//   }
//
//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['id'] = this.id;
//   //   data['main'] = this.main;
//   //   data['description'] = this.description;
//   //   data['icon'] = this.icon;
//   //   return data;
//   // }
// }
//
// class Main {
//   double? temp;
//   double? feelsLike;
//   double? tempMin;
//   double? tempMax;
//   int? pressure;
//   int? humidity;
//   int? seaLevel;
//   int? grndLevel;
//
//   Main(
//       {this.temp,
//       this.feelsLike,
//       this.tempMin,
//       this.tempMax,
//       this.pressure,
//       this.humidity,
//       this.seaLevel,
//       this.grndLevel});
//
//   factory Main.fromJson(dynamic json) {
//     if (json == null) {
//       return Main();
//     } else {
//       return Main(
//           temp: json['temp'],
//           feelsLike: json['feels_like'],
//           tempMin: json['temp_min'],
//           tempMax: json['temp_max'],
//           pressure: json['pressure'],
//           humidity: json['humidity'],
//           seaLevel: json['sea_level'],
//           grndLevel: json['grnd_level']);
//     }
//     // temp = json['temp'];
//     // feelsLike = json['feels_like'];
//     // tempMin = json['temp_min'];
//     // tempMax = json['temp_max'];
//     // pressure = json['pressure'];
//     // humidity = json['humidity'];
//     // seaLevel = json['sea_level'];
//     // grndLevel = json['grnd_level'];
//   }
//
//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['temp'] = this.temp;
//   //   data['feels_like'] = this.feelsLike;
//   //   data['temp_min'] = this.tempMin;
//   //   data['temp_max'] = this.tempMax;
//   //   data['pressure'] = this.pressure;
//   //   data['humidity'] = this.humidity;
//   //   data['sea_level'] = this.seaLevel;
//   //   data['grnd_level'] = this.grndLevel;
//   //   return data;
//   // }
// }
//
// class Wind {
//   double? speed;
//   int? deg;
//   double? gust;
//
//   Wind({this.speed, this.deg, this.gust});
//
//   factory Wind.fromJson(dynamic json) {
//     if (json == null) {
//       return Wind();
//     } else {
//       return Wind(speed: json['speed'], deg: json['deg'], gust: json['gust']);
//       // speed = json['speed'];
//       // deg = json['deg'];
//       // gust = json['gust'];
//     }
//
//     // Map<String, dynamic> toJson() {
//     //   final Map<String, dynamic> data = new Map<String, dynamic>();
//     //   data['speed'] = this.speed;
//     //   data['deg'] = this.deg;
//     //   data['gust'] = this.gust;
//     //   return data;
//     // }
//   }
// }
//
// class Clouds {
//   int? all;
//
//   Clouds({this.all});
//
//   factory Clouds.fromJson(dynamic json) {
//     if (json == null) {
//       return Clouds();
//     } else {
//       return Clouds(all: json['all']);
//       // all = json['all'];
//     }
//
//     // Map<String, dynamic> toJson() {
//     //   final Map<String, dynamic> data = new Map<String, dynamic>();
//     //   data['all'] = this.all;
//     //   return data;
//     // }
//   }
// }
//
// class Sys {
//   String? country;
//   int? sunrise;
//   int? sunset;
//
//   Sys({this.country, this.sunrise, this.sunset});
//
//   factory Sys.fromJson(dynamic json) {
//     if (json == null) {
//       return Sys();
//     } else {
//       return Sys(
//         country: json['country'],
//         sunrise: json['sunrise'],
//         sunset: json['sunset'],
//       );
//       // country = json['country'];
//       // sunrise = json['sunrise'];
//       // sunset = json['sunset'];
//     }
//
//     // Map<String, dynamic> toJson() {
//     //   final Map<String, dynamic> data = new Map<String, dynamic>();
//     //   data['country'] = this.country;
//     //   data['sunrise'] = this.sunrise;
//     //   data['sunset'] = this.sunset;
//     //   return data;
//     // }
//   }
// }
@immutable
class WeatherMain extends Equatable {
  num? lat;
  num? lon;
  String? timezone;
  num? timezoneOffset;
  Current? current;
  List<Hourly>? hourly;

  WeatherMain(
      {this.lat,
      this.lon,
      this.timezone,
      this.timezoneOffset,
      this.current,
      this.hourly});

  factory WeatherMain.fromJson(dynamic json) {
    if (json == null) {
      return WeatherMain();
    } else {
      print('covert thanh cong');
      return WeatherMain(
          lat: json['lat'],
          lon: json['lon'],
          timezone: json['timezone'],
          timezoneOffset: json['timezone_offset'],
          current: Current.fromJson(json['current']),
          hourly: (json['hourly'] as List).map((e) => Hourly.fromJson(e)).toList());
    }

  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [lat, lon, timezone, timezoneOffset, current, hourly];
}


class Weather {
  num? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(dynamic json) {
    if (json == null) {
      return Weather();
    } else {
      return Weather(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon'],
      );
    }
  }
}

class Current {
  num? dt;
  num? sunrise;
  num? sunset;
  num? temp;
  num? feelsLike;
  num? pressure;
  num? humidity;
  num? dewPoint;
  num? uvi;
  num? clouds;
  num? visibility;
  num? windSpeed;
  num? windDeg;
  List<Weather>? weather;

  Current(
      {this.dt,
      this.sunrise,
      this.sunset,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.uvi,
      this.clouds,
      this.visibility,
      this.windSpeed,
      this.windDeg,
      this.weather});

  factory Current.fromJson(dynamic json) {
    if (json == null) {
      return Current();
    } else {
      return Current(
        dt: json['dt'],
        sunrise: json['sunrise'],
        sunset: json['sunset'],
        temp: json['temp'],
        feelsLike: json['feels_like'],
        pressure: json['pressure'],
        humidity: json['humidity'],
        dewPoint: json['dew_point'],
        uvi: json['uvi'],
        clouds: json['clouds'],
        visibility: json['visibility'],
        windSpeed: json['wind_speed'],
        windDeg: json['wind_deg'],
        weather:
            (json['weather'] as List).map((e) => Weather.fromJson(e)).toList(),
      );
    }
  }
}


class Hourly {
  num? dt;
  num? temp;
  num? feelsLike;
  num? pressure;
  num? humidity;
  num? dewPoint;
  num? uvi;
  num? clouds;
  num? visibility;
  num? windSpeed;
  num? windDeg;
  num? windGust;
  List<Weather>? weather;
  num? pop;

  Hourly(
      {this.dt,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.uvi,
      this.clouds,
      this.visibility,
      this.windSpeed,
      this.windDeg,
      this.windGust,
      this.weather,
      this.pop});

  factory Hourly.fromJson(dynamic json) {
    if (json == null) {
      return Hourly();
    } else {
      return Hourly(
        dt: json['dt'],
        temp: json['temp'],
        feelsLike: json['feels_like'],
        pressure: json['pressure'],
        humidity: json['humidity'],
        dewPoint: json['dew_point'],
        uvi: json['uvi'],
        clouds: json['clouds'],
        visibility: json['visibility'],
        windSpeed: json['wind_speed'],
        windDeg: json['wind_deg'],
        windGust: json['wind_gust'],
        weather:
            (json['weather'] as List).map((e) => Weather.fromJson(e)).toList(),
        pop: json['pop'],
      );
    }
  }
}
