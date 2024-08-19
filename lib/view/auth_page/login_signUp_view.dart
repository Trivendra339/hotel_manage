import 'package:flutter/material.dart';
import 'package:hotel_manage/utils/routes/routes_name.dart';

import '../../res/components/app_colors.dart';

class Login_Signup2 extends StatelessWidget {
  const Login_Signup2({super.key});

  @override
  Widget build(BuildContext context) {
    late Size mq = MediaQuery.of(context).size * 1;
    return Scaffold(
      body: Stack(
        children: [
          Container(height: double.infinity,width: double.infinity,
            color: Colors.cyan,
          ),
          Image.asset(
              fit: BoxFit.cover,
              height: double.infinity,
              "assets/images/start_login_signup.png"),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: mq.height*0.08,horizontal: mq.width*0.06),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      height: 40.8,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RouteName.Login_view2);
                        },
                        child: const Text(
                          "Login",
                          style: const TextStyle(
                              color: MyAppColors.blackColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                  SizedBox(
                    height: mq.height * 0.03,
                  ),
                  const Row(
                    children: [
                      Expanded(
                          child:  Divider(
                        thickness: 1,
                        endIndent: 10,
                        color: Colors.white,
                      )),
                      Text(
                        "OR",
                        style: TextStyle(color: Colors.white),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 1,
                        indent: 10,
                        color: Colors.white,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: mq.height * 0.03,
                  ),
                  Container(
                    height: 40.8,
                    width: double.infinity,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        side: WidgetStateProperty.all<BorderSide>(const BorderSide(
                            color: Colors.white,
                            width: 2.5,
                            style: BorderStyle.solid)),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, RouteName.SignUp_view2);
                      },
                      child: const Text(
                        "Create an account",
                        style: TextStyle(
                            color: MyAppColors.whiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              ),
          ),

        ],
      ),
    );
  }
}
