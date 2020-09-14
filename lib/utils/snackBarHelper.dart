import 'package:flutter/material.dart';
import 'package:qr_gen/utils/flushbarHelper.dart';

class SnackBarHelper {
  static const Duration _duration = Duration(seconds: 2);

  static showInformation({BuildContext context, String title, String message}) {
    FlushbarHelper.createInformation(
      message: message,
      title: title,
      duration: Duration(seconds: 2),
    )..show(context);
  }
}
