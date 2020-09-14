import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_gen/constants/customColors.dart';
import 'package:qr_gen/router/router.dart';

class QrCodePage extends StatelessWidget {
  QrCodePage(this.phoneNumber);

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              child: QrImage(
        data: phoneNumber,
        version: QrVersions.auto,
        size: 200.0,
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
