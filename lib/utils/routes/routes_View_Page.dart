import 'package:flutter/material.dart';
import 'package:hotel_manage/utils/routes/routes_name.dart';
import 'package:hotel_manage/view/auth_page/login_view.dart';
import 'package:hotel_manage/view/auth_page/signUp_view.dart';
import 'package:hotel_manage/view/splash_page/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    // Account Authentication Routes_
    switch (settings.name) {
      case RouteName.Splash_view:
        return MaterialPageRoute(builder: (context) => SplashScreen());

      case RouteName.Login_view:
        return MaterialPageRoute(builder: (context) => LogIn_Screen());

      case RouteName.SignUp_view:
        return MaterialPageRoute(builder: (context) => SignUp_Screen());

      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text("Something Went Wrong"),
            ),
          );
        });
    }
  }
}
