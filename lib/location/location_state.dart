part of 'location_bloc.dart';

@immutable
class LocationState {
  // double locationLat;
  // double locationLong;
  // LocationState({required this.locationLat,required this.locationLong});
  Position? location;
  LocationState({this.location});
}

class LocationInitial extends LocationState {
  LocationInitial() : super();

}
