import 'package:flutter/material.dart';
import 'package:hotel_manage/utils/routes/routes_name.dart';
import 'package:hotel_manage/view/splash_page/splash_screen.dart';

import '../../view/admin_app/admin_home_screen.dart';
import '../../view/tenant_app/auth_page/demo_enter_screen.dart';
import '../../view/tenant_app/auth_page/demo_login_screen.dart';
import '../../view/tenant_app/auth_page/demo_signUp_screen.dart';
import '../../view/tenant_app/auth_page/login_screen.dart';
import '../../view/tenant_app/auth_page/login_signUp_screen.dart';
import '../../view/tenant_app/auth_page/signUp_screen.dart';
import '../../view/tenant_app/tenant_page/floorOF_data_screen.dart';
import '../../view/tenant_app/tenant_page/roomrOF_data_screen.dart';
import '../../view/tenant_app/tenant_page/tenant_home_screen.dart';


class MyAppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    // Account Authentication Routes :-
    switch (settings.name) {
      case MyRouteName.Splash_view:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case MyRouteName.LoginScreen:
        return MaterialPageRoute(builder: (context) => const LogIn_Screen());

      case MyRouteName.SignUpScreen:
        return MaterialPageRoute(builder: (context) => const SignUp_Screen());

      case MyRouteName.Login_Signup_Screen2:
        return MaterialPageRoute(builder: (context) => const Login_Signup2());

      case MyRouteName.LoginScreen2:
        return MaterialPageRoute(builder: (context) => const Login_Screen2());

      case MyRouteName.SignUpScreen2:
        return MaterialPageRoute(builder: (context) => const SignUp_Screen2());

      case MyRouteName.EnterCodeScreen2:
        return MaterialPageRoute(builder: (context) => const Enter_Code2());

     // Admin Route :-
      case MyRouteName.AdminHomeScreen:
        return MaterialPageRoute(builder: (context) => const Admin_Home_Screen());


    // Tenant Route :-
      case MyRouteName.TenantHomeScreen:
        return MaterialPageRoute(builder: (context) =>  Tenant_Home_Screen());
      case MyRouteName.FloorOFDataScreen:
        return MaterialPageRoute(builder: (context) =>  FloorOF_Data_Screen());
      case MyRouteName.RoomOFDataScreen:
        return MaterialPageRoute(builder: (context) =>  RoomOF_Data_Screen());


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
