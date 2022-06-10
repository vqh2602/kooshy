import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatelessWidget {
  static const String routeName = '/SettingPage';

  const SettingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    Future<void> _launchInBrowser(Uri url) async {
      if (!await launchUrl(url,
          //mode: LaunchMode.inAppWebView
          // mode: LaunchMode.externalApplication,
          // forceWebView = true,
          )) {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('acssets/images/background/backgroundsetting.jpg'),
          // image:
          // NetworkImage(
          //     convertRandomBG(i)),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Text(
                //   'Setting',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 20,
                //   ),
                // ),
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          //                   <--- left side
                          color: Colors.white,
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          //                   <--- left side
                          color: Colors.white,
                          width: 1.0,
                        ),
                )),
                  child: Center(
                    child: InkWell(
                      onTap: () async {
                        const url = 'mailto:vqh2602@gmail.com';
                        _launchInBrowser(Uri.parse(url));
                      },
                      child: const Text("Báo Lỗi",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          //                   <--- left side
                          color: Colors.white,
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          //                   <--- left side
                          color: Colors.white,
                          width: 1.0,
                        ),
                      )),
                  child: Center(
                    child: InkWell(
                      onTap: () async {
                        const url = 'mailto:vqh2602@gmail.com';
                        _launchInBrowser(Uri.parse(url));
                      },
                      child: const Text("Hướng Dẫn Sử Dụng",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
