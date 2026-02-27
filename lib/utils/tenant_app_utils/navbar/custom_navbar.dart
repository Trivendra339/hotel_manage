import 'package:flutter/material.dart';
import 'package:manage_hotel/utils/routes/routes_name.dart';

import '../../../view/theme/app_colors.dart';

Widget customNavBar(
        {required BuildContext context,
    //    required AnimationController animationController,
        Function()? onAddButtonPressed}) =>
    // AnimatedContainer(
    //     duration: Duration(seconds: 1),
    //     curve: Curves.easeOut,
    //     child:
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 40,
          decoration: BoxDecoration(
              // color: Color(0xffeff0f4),
          //  color: Color(0xfff3f0f0),
            color: AppColors.homeBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0), topRight: Radius.circular(0)),
              // boxShadow: [
              //   BoxShadow(
              //       color: Colors.black.withAlpha(15),
              //       blurRadius: 20,
              //       spreadRadius: 10),
              // ]
          // gradient: LinearGradient(
          //   colors: [
          //     Color(0xffa3bded),
          //     Color(0xff6991c7)
          //   ]
          // )
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton( 
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),

              IconButton(icon: Icon(Icons.add), onPressed: onAddButtonPressed),

              IconButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context,
                        AppRouteName.tenantHomeScreen, (route) => false);
                  },
                  icon: Icon(Icons.home_outlined))
            ],
          ),
       // )
    );
