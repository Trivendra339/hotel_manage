import 'package:flutter/material.dart';
import 'package:hotel_manage/utils/utils.dart';
import 'package:hotel_manage/res/components/app_colors.dart';
import 'package:hotel_manage/res/components/text_style.dart';

class LogIn_Screen extends StatefulWidget {
  const LogIn_Screen({super.key});

  @override
  State<LogIn_Screen> createState() => _LogIn_ScreenState();
}

class _LogIn_ScreenState extends State<LogIn_Screen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: MyAppColors.topDesignColor,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(60))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Image.asset(color: Colors.white,
                          "assets/images/SignUp_LOGO.jpg"),
                    )
                  ],
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.666,
              decoration: const BoxDecoration(
                color: MyAppColors.topDesignColor,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(top: 40,bottom: 30),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.666,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(60))
              ),
              child: Column(
                children: [
                  InkWell(onTap: (){Utils.flushBarMessage(message: "Login Kar Lo Bhai", context: context);},
                      child: Text("Login Page",style: myTextStyle20(textColor: Colors.black),))
                ],
              ),
            ),
          )
        ],
      ),
      ),
    );
  }
}
