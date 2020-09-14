import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:phone_number/phone_number.dart';
import 'package:libphonenumber/libphonenumber.dart';

import '../router/router.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    load();
  }

  Future load() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Center(
          child: ListView(
        children: <Widget>[
          Container(
              child: TextFormField(
            controller: phoneNumberController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(labelText: "Phone number"),
          )),
          RaisedButton(
            child: Text("QR Code Generate"),
            onPressed: () {
              Router.toQrCodePage(phoneNumberController.text);
            },
          )
        ],
      )),
    );
  }
}
