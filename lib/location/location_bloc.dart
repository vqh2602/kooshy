

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    // on<LocationEvent>((event, emit) {
    //   // TODO: implement event handler
    //   on<GetLocationEvent>((event, emit) async => emit(LocationState(
    //       location: await locateUser()
    //   )));
    // });
    on<GetLocationEvent>(_onWeatherRequested);
  }

  Future<Position> locateUser() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  void _onWeatherRequested(LocationEvent event, Emitter emit) async {
    try {
      emit(LocationState(
              location: await locateUser()
          ));
      print("chay event");
    } catch (_) {
      print("chay event lỗi");
    }
  }

}
