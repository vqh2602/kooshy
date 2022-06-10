

import 'package:flutter/material.dart';
import 'package:kooshy/mainPage/weatherPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'introScreen.dart';


class SplashScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _MySplashScreen(show);
  }

}


class _MySplashScreen extends State<SplashScreen>{

_MySplashScreen(bool show);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>show ? IntroScreen() : weatherPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return
      Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('acssets/images/logoSplashScreen/logovqhapps.png',width: 200,height: 200,),
              const CircularProgressIndicator(),
            ],
          )
        ),
      ),
    );
  }
}