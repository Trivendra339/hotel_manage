import 'package:manage_hotel/utils/app_export.dart';
import 'package:manage_hotel/view/screens/tenant_app/room_data_screen.dart';
import 'package:manage_hotel/view/screens/tenant_app/tenant_home_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Account Authentication Routes :-
    switch (settings.name) {
      case AppRouteName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case AppRouteName.loginScreen:
        return MaterialPageRoute(
            builder: (context) => LogInScreen());

      case AppRouteName.signUpScreen:
        return MaterialPageRoute(builder: (context) => const SignUp_Screen());

      case AppRouteName.forgetPassScreen:
        return MaterialPageRoute(
            builder: (context) => ForgetPassScreen());

      case AppRouteName.resetPassScreen:
        return MaterialPageRoute(builder: (context) => const ResetPassScreen());




      case AppRouteName.loginSignupScreen2:
        return MaterialPageRoute(builder: (context) => const Login_Signup2());

      case AppRouteName.loginScreen2:
        return MaterialPageRoute(builder: (context) => const LoginScreen2());

      case AppRouteName.signUpScreen2:
        return MaterialPageRoute(builder: (context) => const SignUpScreen2());

      case AppRouteName.enterCodeScreen2:
        return MaterialPageRoute(builder: (context) => const EnterCode2());




      // Admin Route :-
      case AppRouteName.adminHomeScreen:
        return MaterialPageRoute(
            builder: (context) => const AdminHomeScreen());


      // Tenant Route :-
      case AppRouteName.tenantHomeScreen:
        return MaterialPageRoute(builder: (context) => const TenantHomeScreen());

      case AppRouteName.floorOFDataScreen:
        return MaterialPageRoute(builder: (context) => const FloorOFDataScreen());

      case AppRouteName.roomOFDataScreen:
        return  MaterialPageRoute(builder: (context) => const RoomDataScreen());


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
