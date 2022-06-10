import 'package:introduction_screen/introduction_screen.dart';
import 'package:kooshy/mainPage/weatherPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  ///Changed a little bit of buttons styling and text for the thumbnail lol
  ///Thanks for coming here :-)


  @override
  Widget build(BuildContext context) {

    Future<void> _showMyDialog(String title,content) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  // Text('This is a demo alert dialog.'),
                  Text('$content'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Approve'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    final List<PageViewModel> pages = [
      PageViewModel(
          title: AppLocalizations.of(context)!.introAppTitle,
          body: AppLocalizations.of(context)!.introApp,
          // footer: SizedBox(
          //   height: 45,
          //   width: 300,
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //         primary: Colors.green,
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(20)
          //         ),
          //         elevation: 8
          //     ),
          //     onPressed: () {
          //       _showMyDialog('KooShy','Một ứng dụng gọn nhẹ, giúp bạn giải toả căng thẳng và giảm thời gian sử dụng điện thoại');
          //     },
          //     child: const Text("Chi tiết", style: TextStyle(fontSize: 20)),
          //   ),
          // ),
          image: Center(
            child: Image.asset('acssets/images/introScreen/logoKooshy.png'),
          ),
          decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              )
          )
      ),
      PageViewModel(
          title: AppLocalizations.of(context)!.introWeatherTitle,
          body: AppLocalizations.of(context)!.introWeather,
          // footer: SizedBox(
          //   height: 45,
          //   width: 300,
            // child: ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     // primary: Colors.red,
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(20)
            //       ),
            //       elevation: 8
            //   ),
            //   onPressed: () {
            //     _showMyDialog('Thời Tiết Chính Xác','Hiển thị thông tin thời tiết chính xác từ vị trí của bạn, 7 ngày, hiện tại, đầy đủ và trực quan');
            //   },
            //   child: const Text("Chi tiết", style: TextStyle(fontSize: 20),),
            // ),
          // ),
          image: Center(
            child: Image.asset('acssets/images/introScreen/introKooshy2.png'),
          ),
          decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              )
          )
      ),
      PageViewModel(
          title: AppLocalizations.of(context)!.introMusicTitle,
          body: AppLocalizations.of(context)!.introMusic,
          // footer: SizedBox(
          //   height: 45,
          //   width: 300,
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //         primary: Colors.red,
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(20)
          //         ),
          //         elevation: 8
          //     ),
          //     onPressed: () {
          //       _showMyDialog('Những Bản Nhạc Thư Gian', 'Chạm vào vòng tròn bên ngoài bao quanh biểu tượng thời tiết thể phát nhạc thư giãn và giảm stress, với những bản nhạc theo chủ đề thời tiết hiện tại');
          //     },
          //     child: const Text("Chi tiết", style: TextStyle(fontSize: 20)),
          //   ),
          // ),
          image: Center(
            child: Image.asset('acssets/images/introScreen/introKooshy3.png'),
          ),
          decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              )
          )
      ),
    ];




    return Scaffold(
      appBar: AppBar(
        title: const Text('Chào Mừng Bạn Đến Với KooShy'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(15, 15),
            color: Colors.blue,
            activeSize: Size.square(20),
            activeColor: Colors.red,
          ),
          showDoneButton: true,
          done: const Text('Done', style: TextStyle(fontSize: 20),),
          showSkipButton: true,
          skip: const Text('Skip', style: TextStyle(fontSize: 20),),
          showNextButton: true,
          next: const Icon(Icons.arrow_forward, size: 25,),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => weatherPage()));
  }
}




