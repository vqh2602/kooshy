import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/weather.dart';
import '../events/weatherEvent.dart';
import '../repositories/weatherRepositories.dart';
import '../states/weatherState.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepositories weatherRepositories;
  WeatherBloc({required this.weatherRepositories})
      : super(WeatherStateInitial()) {
    on<WeatherEventRequest>(_onWeatherRequested);
    on<WeatherEventRefesh>(_onWeatherRefesh);
  }

  void _onWeatherRequested(WeatherEventRequest event, Emitter emit) async {
    emit(WeatherStateLoading());
    try {
      final WeatherMain weather = await weatherRepositories.fetchWeather(
          event.lat, event.long, event.lang);
      print("chay event 1111 : ");
      emit(WeatherStateSuccess(autogeneratedWeather: weather));
      print("chay event: " + weather.toString());
    } catch (_) {
      emit(WeatherStateFail());
      final WeatherMain weather = await weatherRepositories.fetchWeather(
          event.lat, event.long, event.lang);
      emit(WeatherStateSuccess(autogeneratedWeather: weather));
      print("chay event lỗi");
    }
  }

  void _onWeatherRefesh(WeatherEventRefesh event, Emitter emit) async {
    emit(WeatherStateLoading());
    try {
      final WeatherMain weather = await weatherRepositories.fetchWeather(
          event.lat, event.long, event.lang);
      emit(WeatherStateSuccess(autogeneratedWeather: weather));
    } catch (_) {
      emit(WeatherStateFail());
    }
  }
}