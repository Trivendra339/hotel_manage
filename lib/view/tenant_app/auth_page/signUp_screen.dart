import 'package:flutter/material.dart';

import '../../../utils/components/app_colors.dart';
import '../../../utils/components/text_style.dart';
import '../../../utils/utils.dart';

class SignUp_Screen extends StatefulWidget {
  const SignUp_Screen({super.key});

  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {
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
                  child: Center(child: Text('Welcome my app',style: myTextStyle20())),
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
