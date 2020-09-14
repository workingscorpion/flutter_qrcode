import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodePage extends StatelessWidget {
  QrCodePage(this.phoneNumber);

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    print('phoneNumber : ' + phoneNumber.toString());
    return Scaffold(
      body: Center(
          child: Container(
              // child: Text(phoneNumber),
              child: QrImage(
        data: phoneNumber,
        version: QrVersions.auto,
        size: 200.0,
      ))),
    );
  }
}
