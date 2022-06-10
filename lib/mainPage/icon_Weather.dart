import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../Models/weather.dart';
import '../bloc/weatherBloc.dart';
import '../states/weatherState.dart';
import 'audio_page.dart';
import 'convert_Id_weather.dart';

class IconWeather extends StatelessWidget {
  const IconWeather({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    DateTime now = DateTime.now();
    // play(String uri){
    //   const kUrl1 = 'https://luan.xyz/files/audio/ambient_c_motion.mp3';
    //   //final Uri url = Uri.parse(uri);
    //   audioPlayer.play(uri);
    //   print('run adio');
    //
    // }
    //  playRemoteFile() {
    //   AudioPlayer player = AudioPlayer();
    //   print("playyyy);
    //   player.play("https://luan.xyz/files/audio/ambient_c_motion.mp3");
    // }
    return Expanded(
      flex: 12,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
            width: 200,
            height: 200,
            child: AudioPage(),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, stateWeather) {
                  if(stateWeather is WeatherStateFail){
                    return Lottie.asset('acssets/iconAnimation/errorCat.json');
                  }

                  if (stateWeather is WeatherStateLoading) {
                    return Lottie.asset(
                        "acssets/iconAnimation/loaddingSlime.json");
                  }
                  if (stateWeather is WeatherStateSuccess) {
                    final WeatherMain weather = stateWeather.autogeneratedWeather;
                    // print("thoi gian" + "${now.toString()}");
                    String urlLottie =
                        'acssets/iconAnimation/loaddingSlime.json';
                    switch (convertIdWeather(weather.current!.weather![0].id!.toInt())) {
                      case 200:
                        urlLottie =
                        'acssets/iconAnimation/strom.json';
                        break;
                      case 211:
                        urlLottie =
                        'acssets/iconAnimation/cloudThunder.json';
                        break;
                      case 300:
                        (now.hour < 18 && now.hour > 5)
                            ? urlLottie =
                        'acssets/iconAnimation/sunnyRain.json'
                            : urlLottie =
                        'acssets/iconAnimation/moonRain.json';
                        break;
                      case 500:
                        (now.hour < 18 && now.hour > 5)
                            ? urlLottie =
                        'acssets/iconAnimation/sunnyRain.json'
                            : urlLottie =
                        'acssets/iconAnimation/moonRain.json';
                        break;
                      case 511:
                        (now.hour < 18 && now.hour > 5)
                            ? urlLottie =
                        'acssets/iconAnimation/snowCould.json'
                            : urlLottie =
                        'acssets/iconAnimation/snowCould.json';
                        break;
                      case 600:
                        (now.hour < 18 && now.hour > 5)
                            ? urlLottie =
                        'acssets/iconAnimation/snowSunny.json'
                            : urlLottie =
                        'acssets/iconAnimation/snowMoon.json';
                        break;
                      case 700:
                        (now.hour < 18 && now.hour > 5)
                            ? urlLottie =
                        'acssets/iconAnimation/sunnyMist.json'
                            : urlLottie =
                        'acssets/iconAnimation/mist.json';
                        break;
                      case 800:
                        (now.hour < 18 && now.hour > 5)
                            ? urlLottie =
                        'acssets/iconAnimation/sunny.json'
                            : urlLottie =
                        'acssets/iconAnimation/moon.json';
                        break;
                      case 801:
                        (now.hour < 18 && now.hour > 5)
                            ? urlLottie =
                        'acssets/iconAnimation/cloudSunnyMin.json'
                            : urlLottie =
                        'acssets/iconAnimation/cloudMoonMin.json';
                        break;
                      case 803:
                        urlLottie =
                        'acssets/iconAnimation/cloud.json';
                        break;
                    }
                    return Lottie.asset(urlLottie);
                  } else {
                    // print("lay dl tt_erro");
                    // play('https://luan.xyz/files/audio/ambient_c_motion.mp3');
                    return Lottie.asset(
                        'acssets/iconAnimation/loaddingSlime.json',);
                  }

                }),
          ),
        ],
      ),
    );
  }
}
