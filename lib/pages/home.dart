import 'package:flutter/material.dart';
import 'package:qr_gen/constants/customColors.dart';
import 'package:qr_gen/utils/snackBarHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:intl/intl.dart';
import '../router/router.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(right: 30, left: 30),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: CustomColors.primaryColor,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.32,
              ),
              Container(
                child: TextField(
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  keyboardType: TextInputType.phone,
                  controller: phoneNumberController,
                  decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 20)),
                ),

                //     TextField(
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.teal, width: 1)),
                //     labelText: 'Phone Number',
                //     prefixIcon: Icon(
                //       Icons.phone,
                //       color: Colors.white,
                //     ),
                //     // suffixStyle: const TextStyle(color: Colors.white)
                //   ),
                // )
              ),
              // Container(
              //     child: TextFormField(
              //   controller: phoneNumberController,
              //   keyboardType: TextInputType.phone,
              //   decoration: InputDecoration(
              //       labelText: "Phone number", fillColor: Colors.white),
              // )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Container(
                padding: EdgeInsets.only(right: 75, left: 75),
                height: 80,
                width: 50,
                child: RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: CustomColors.primaryColor)),
                  // child: Text("QR Code Generate"),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 60,
                        child: Image.asset(
                          'assets/icons/logo.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Text('QRCode Generate')
                    ],
                  ),
                  onPressed: () async {
                    if (phoneNumberController.text.length >= 10) {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString(
                          'phone_number', phoneNumberController.text);

                      final key = 'workingscorpion';
                      final claimSet = new JwtClaim(
                          subject: phoneNumberController.text +
                              '\n${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now())}',
                          issuer: 'workingscorpion',
                          audience: <String>['workingscorpion.shop'],
                          otherClaims: <String, dynamic>{
                            'typ': 'authnresponse',
                            'pld': {'k': 'v'}
                          },
                          maxAge: Duration(minutes: 1));

                      Router.toQrCodePage(issueJwtHS256(claimSet, key));
                    } else {
                      SnackBarHelper.showInformation(
                          context: context,
                          title: "생성 불가",
                          message: "휴대폰 번호 길이가 너무 짧습니다.");
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}
