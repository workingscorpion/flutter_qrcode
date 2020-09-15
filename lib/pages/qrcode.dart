import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_gen/constants/customColors.dart';
import 'package:qr_gen/router/router.dart';

class QrCodePage extends StatelessWidget {
  QrCodePage(this.token);

  final String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              child: QrImage(
        data: token,
        version: 11,
        size: 300.0,
      ))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColors.primaryColor,
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        elevation: 10,
        onPressed: () {
          Router.toHome();
        },
      ),
    );
  }
}
