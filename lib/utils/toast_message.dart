import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:another_flushbar/flushbar.dart';

class ToastMessage{


  static void flushBarMessage({required String message, required BuildContext context,Color bgColor = Colors.black,Color msgColor = Colors.white}){

    showFlushbar(context: context,
        flushbar: Flushbar(
          message: message,

      forwardAnimationCurve: Curves.decelerate,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.all(15),
      titleColor: Colors.white,

      borderRadius: BorderRadius.circular(10),
      reverseAnimationCurve: Curves.easeOut,

      backgroundColor: bgColor,
      flushbarPosition: FlushbarPosition.BOTTOM,
      positionOffset: 20,



      messageColor: msgColor,

      duration: Duration(seconds: 2),
    )..show(context)
    );
  }
}