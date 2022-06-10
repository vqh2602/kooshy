import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget{
  static const String routeName = '/ContactPage';

  const ContactPage({Key? key}) : super(key: key);

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
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('acssets/images/background/backgroundinfo.jpg'),
                // image:
                // NetworkImage(
                //     convertRandomBG(i)),
                fit: BoxFit.cover,
              )
          ),
          child:SafeArea(
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
                          const url = 'https://chinhsachbaomatvqhapp.blogspot.com/';
                          _launchInBrowser(Uri.parse(url));
                        },
                        child: const Text("Chính Sách Bảo Mật",
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
                          const url = 'https://dieukhoanvqhapps.blogspot.com/';
                          _launchInBrowser(Uri.parse(url));
                        },
                        child: const Text("Điều Khoản Sử Dụng",
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
                          const url = 'https://vqhapps.blogspot.com/';
                          _launchInBrowser(Uri.parse(url));
                        },
                        child: const Text("Website Nhà Phát Triển",
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
      ),
    );
  }

}