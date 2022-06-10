import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kooshy/data/backgroung_data_url.dart';

import '../Models/weather.dart';
import '../bloc/weatherBloc.dart';
import '../states/weatherState.dart';
import 'convert_Id_weather.dart';

String convertRandomBG(int i) {
  final _random = Random();
  DateTime now = DateTime.now();
  switch (i) {
    case 200:
          return listRain[_random.nextInt(listRain.length)];
    case 211:
          return listRain[_random.nextInt(listRain.length)];
    case 300:
      return listRain[_random.nextInt(listRain.length)];
    case 500:
      return listRain[_random.nextInt(listRain.length)];
    case 511:
      return listSnow[_random.nextInt(listSnow.length)];
    case 600:
      return listSnow[_random.nextInt(listSnow.length)];
    case 700:
      return listSmit[_random.nextInt(listSmit.length)];
    case 800:
      if(now.hour < 18 && now.hour > 5){
        return listSun[_random.nextInt(listSun.length)];
      }else{
        return listNight[_random.nextInt(listNight.length)];
      }
    case 801:
      if(now.hour < 18 && now.hour > 5){
        return listCouldSun[_random.nextInt(listCouldSun.length)];
      }else{
        return listCouldNight[_random.nextInt(listCouldNight.length)];
      }
    case 803:
      return listCouldy[_random.nextInt(listCouldy.length)];
    default:
      return 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhjfxfI2LP1JhEIBSbrAZ3sTpZSEyE7-yuJgvZD1TLMduvfV8r-TDCsBRZGdFbQKWUUiJKDLVjQTlzI_gH9D8iHl-_TTvD2rmE1H8llemJvKpru0jj6rSmEPIiZki3Lo85cNPDYdZILjPoZJPO6grXxEXypo_xlkiegTFTeVcSlTofPo1L4pSRwCljJOg/s500/backgroundNight.jpg';
  }
}

Decoration Deco (int i){
  // late String urlimage = 'https://i.pinimg.com/originals/2d/ce/2b/2dce2b15886955b2ae5dbde42830875a.gif';
  return BoxDecoration(
      image: DecorationImage(
        // image: AssetImage('acssets/images/background/backgroundNight.jpg'),
        image:
        NetworkImage(
            convertRandomBG(i)),
        fit: BoxFit.cover,
      ));
}