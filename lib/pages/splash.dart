import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_gen/constants/customColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../router/router.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    load();
  }

  Future load() async {
    startTime();
  }

  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, executeRoute);
  }

  Future executeRoute() async {
    final prefs = await SharedPreferences.getInstance();
    final phoneNumber = prefs.getString('phone_number');
    if (phoneNumber != null) {
      Router.toQrCodePage(phoneNumber);
    } else {
      Router.toHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: CustomColors.primaryColor,
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 250,
                height: 250,
                child: Image.asset('assets/splash/splash.png'),
              ),
              Column(
                children: <Widget>[
                  Text(
                    'QR코드 생성기',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Text(
                    'by workingscorpion',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )
                ],
              )
            ],
          )),
        ));
  }
}
