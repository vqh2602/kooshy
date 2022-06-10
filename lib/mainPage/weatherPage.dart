import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'package:kooshy/location/location_bloc.dart';
import 'package:kooshy/mainPage/ContactPage.dart';
import 'package:kooshy/mainPage/random_background.dart';
import 'package:kooshy/mainPage/settingPage.dart';
import 'package:swipe/swipe.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Models/weather.dart';
import '../bloc/weatherBloc.dart';
import '../events/weatherEvent.dart';
import '../states/weatherState.dart';
import 'body_Weather_page.dart';
import 'convertTimetamp.dart';
import 'convert_Id_weather.dart';

class weatherPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _MyweatherPage();
  }
}
// api https://api.openweathermap.org/data/2.5/weather?lat=23&lon=32&appid=1ab5e5b50cd31038fe5265dea5a1df86&units=metric&lang=vi
/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.

void checklocation() async {
  LocationPermission? permission;
  permission = await Geolocator.requestPermission();
  print("check quyen $permission");
}

class _MyweatherPage extends State<weatherPage> {
  // lấy vị trí
  Future<Position> locateUser() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

// check quyền vị trí
  Future<bool> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return false;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return true;
  }

  bool check_loca = false, getloca = false;
  late Bloc myBloc;
  late StreamSubscription mSub;
  DateTime now = DateTime.now();
  late Position? location;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Hourly> listHouly = [];
  Color TextDrawColor = Colors.white;
  WeatherMain? _weatherMain;
  // print(now.hour.toString() + ":" + now.minute.toString() + ":" + now.second.toString());

  //draw thanh bên

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  // khởi tạo
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // checklocation();
    // bool check = determinePosition() as bool;
    // determinePosition() as bool == false? print("erro"):context.read<LocationBloc>().add(GetLocationEvent());
    determinePosition().then((value) async {
      location = await locateUser();
      setState(() {
        context.read<WeatherBloc>().add(WeatherEventRequest(
            lat: location!.latitude.toString(),
            long: location!.longitude.toString(),
            lang: AppLocalizations.of(context)!.lang));
        // _openEndDrawer();
        // check_loca = value;
        // context.read<LocationBloc>().add(GetLocationEvent());
        // Future.delayed(const Duration(seconds: 5), () {
        //   context.read<LocationBloc>().add(GetLocationEvent());
        //   context.read<WeatherBloc>().add(WeatherEventRequest(long: '0', lat: '0', lang: 'vi'));
        //   print("check: ${value.toString()}");
        // });

        // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        //   // context.read<LocationBloc>().add(GetLocationEvent());
        //   // context.read<WeatherBloc>().add(WeatherEventRequest(long: '0', lat: '0', lang: 'vi'));
        // });
      });
    });
    // Future.delayed(const Duration(seconds: 3), () {
    //   _openEndDrawer();
    // });
    // check_loca
    //     ? context.read<LocationBloc>().add(GetLocationEvent())
    //     : print("erro");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myBloc = BlocProvider.of<LocationBloc>(context);
    mSub = myBloc.stream.listen as StreamSubscription;
    mSub.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      key: _scaffoldKey,
      body: Swipe(
        child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, stateWeather) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            decoration: (() {
              // your code here
              if (stateWeather is WeatherStateLoading) {
                return Deco(1000);
              }
              if (stateWeather is WeatherStateSuccess) {
                final WeatherMain weather = stateWeather.autogeneratedWeather;
                Future.delayed(Duration.zero, () {
                  //your code goes here
                  listHouly = weather.hourly!;
                  _weatherMain = weather;
                  print("lấy list houly thành công ");
                });

                return Deco(
                    convertIdWeather(weather.current!.weather![0].id!.toInt()));
              } else {
                return Deco(1000);
              }
            }()),
            child: BodyWeather(),
          );
        }),
        onSwipeLeft: () {
          setState(() {
            _openEndDrawer();
          });
        },
        onSwipeRight: () {
          setState(() {
            _openEndDrawer();
          });
        },
        onSwipeUp: () {
          context.read<WeatherBloc>().add(WeatherEventRefesh(
              lat: location!.latitude.toString(),
              long: location!.longitude.toString(),
              lang: AppLocalizations.of(context)!.lang));
        },
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.transparent,
        // backgroundColor: Colors.white,
        child: Container(
          width: 50,
          height: 150,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 5.0,
                        sigmaY:
                            5.0), //this is dependent on the import statment above
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5)))),
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(
                          //                   <--- left side
                          color: TextDrawColor,
                          width: 1.0,
                        ),
                      )),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment:
                              CrossAxisAlignment.center, // set your alignment
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(top: 10)),
                                (_weatherMain != null)
                                    ? Text(
                                        'Sunrise: ${ConvertTimeTamp(_weatherMain!.current!.sunrise!.toInt())}',
                                        style: TextStyle(
                                            color: TextDrawColor,
                                            fontFamily: 'ChakraPetch',
                                            fontSize: 15))
                                    : Text('sunrise:...'),
                                const Padding(padding: EdgeInsets.all(10)),
                                (_weatherMain != null)
                                    ? Text(
                                        'Sunset: ${ConvertTimeTamp(_weatherMain!.current!.sunset!.toInt())}',
                                        style: TextStyle(
                                            color: TextDrawColor,
                                            fontFamily: 'ChakraPetch',
                                            fontSize: 15))
                                    : Text('sunrise:...'),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(top: 10)),
                                (_weatherMain != null)
                                    ? Text(
                                        'Humidity: ${_weatherMain!.current!.humidity} %',
                                        style: TextStyle(
                                            color: TextDrawColor,
                                            fontFamily: 'ChakraPetch',
                                            fontSize: 15))
                                    : Text('sunrise:...'),
                                const Padding(padding: EdgeInsets.all(10)),
                                (_weatherMain != null)
                                    ? Text('UV: ${_weatherMain!.current!.uvi}',
                                        style: TextStyle(
                                            color: TextDrawColor,
                                            fontFamily: 'ChakraPetch',
                                            fontSize: 15))
                                    : Text('sunrise:...'),
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    flex: 8,
                    child: ListView.builder(
                        itemCount: listHouly.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Card(
                                color: Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                          'Time: ${ConvertTimeTamp(listHouly[index].dt!.toInt())}',
                                          style: TextStyle(
                                              color: TextDrawColor,
                                              fontFamily: 'ChakraPetch',
                                              fontSize: 12)),
                                      Image.network((listHouly.isNotEmpty)
                                          ? 'http://openweathermap.org/img/wn/${listHouly[index].weather![0].icon}@2x.png'
                                          : 'http://openweathermap.org/img/wn/11d@2x.png'),
                                      Text(
                                          ' ${listHouly[index].temp} °C  | ${listHouly[index].feelsLike} °C ',
                                          style: TextStyle(
                                              color: TextDrawColor,
                                              fontFamily: 'ChakraPetch',
                                              fontSize: 12)),
                                    ],
                                  ),
                                )),
                          );
                        })),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                      top: BorderSide(
                        //                   <--- left side
                        color: TextDrawColor,
                        width: 1.0,
                      ),
                    )),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, SettingPage.routeName,);
                            },
                            child: Icon(
                              Icons.settings_applications_outlined,
                              color: TextDrawColor,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _closeEndDrawer();
                            },
                            child: Icon(Icons.arrow_back_ios,
                                color: TextDrawColor),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, ContactPage.routeName,);
                            },
                            child:
                                Icon(Icons.info_outline, color: TextDrawColor),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // Disable opening the end drawer with a swipe gesture.
      endDrawerEnableOpenDragGesture: false,
    );
  }
}
