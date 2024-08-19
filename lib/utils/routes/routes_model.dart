import 'package:flutter/material.dart';
import 'package:hotel_manage/utils/routes/routes_name.dart';
import 'package:hotel_manage/view/admin_page/admin_home_view.dart';
import 'package:hotel_manage/view/auth_page/demo_enter_code.dart';
import 'package:hotel_manage/view/auth_page/demo_signUp_view.dart';
import 'package:hotel_manage/view/auth_page/login_signUp_view.dart';
import 'package:hotel_manage/view/auth_page/login_view.dart';
import 'package:hotel_manage/view/auth_page/signUp_view.dart';
import 'package:hotel_manage/view/tenant_page/floor_data_view.dart';
import 'package:hotel_manage/view/tenant_page/floor_home_view.dart';
import 'package:hotel_manage/view/splash_page/splash_view.dart';

import '../../view/auth_page/demo_login_view.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    // Account Authentication Routes :-
    switch (settings.name) {
      case RouteName.Splash_view:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case RouteName.Login_view:
        return MaterialPageRoute(builder: (context) => const LogIn_Screen());

      case RouteName.SignUp_view:
        return MaterialPageRoute(builder: (context) => const SignUp_Screen());

      case RouteName.Login_Signup_view2:
        return MaterialPageRoute(builder: (context) => const Login_Signup2());

      case RouteName.Login_view2:
        return MaterialPageRoute(builder: (context) => const Login_Screen2());

      case RouteName.SignUp_view2:
        return MaterialPageRoute(builder: (context) => const SignUp_Screen2());

      case RouteName.Enter_Code_view2:
        return MaterialPageRoute(builder: (context) => const Enter_Code2());

     // Admin Route :-
      case RouteName.AdminHomeView:
        return MaterialPageRoute(builder: (context) => const Admin_Home_Screen());


    // Tenant Route :-
      case RouteName.Home_view:
        return MaterialPageRoute(builder: (context) => const Home_Screen());
      case RouteName.FloorDataView:
        return MaterialPageRoute(builder: (context) =>  Floor_Data_Screen());


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
