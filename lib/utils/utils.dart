import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:another_flushbar/flushbar.dart';

class Utils{

  static void fieldFocusChange(BuildContext context,FocusNode current, FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }


  static void flushBarMessage(
      {required String message,
        required BuildContext context,
        Color bgColor = Colors.black,
        Color msgColor = Colors.white,
        Color iconColor = Colors.white,
        IconData? icon
        }){


    showFlushbar(context: context,
        flushbar: Flushbar(
          message: message,
      icon: Icon(icon,color: iconColor,),

      forwardAnimationCurve: Curves.decelerate,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.all(15),
      titleColor: Colors.white,

      borderRadius: BorderRadius.circular(10),
      reverseAnimationCurve: Curves.easeOut,

      backgroundColor: bgColor,
      flushbarPosition: FlushbarPosition.TOP,
      positionOffset: 20,



      messageColor: msgColor,

      duration: const Duration(seconds: 2),
    )..show(context)
    );
  }
}