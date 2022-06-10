import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherEventRequest extends WeatherEvent {
  String lat, long, lang;
  WeatherEventRequest(
      {required this.lat, required this.long, required this.lang});

  @override
  // TODO: implement props
  List<Object?> get props => [lat, long, lang];
}

class WeatherEventRefesh extends WeatherEvent {
  String lat, long, lang;
  WeatherEventRefesh(
      {required this.lat, required this.long, required this.lang});

  @override
  // TODO: implement props
  List<Object?> get props => [lat, long, lang];
}
