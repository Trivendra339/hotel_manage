import 'package:manage_hotel/utils/app_export.dart';
import 'package:manage_hotel/view_model/splash_user_viewModel/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    splashServices.checkAuthentication(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Text("Splash Screen!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
      ),
    );
  }
}
