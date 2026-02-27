import 'package:manage_hotel/utils/app_export.dart';
import 'package:manage_hotel/utils/routes/routes.dart';
import 'package:manage_hotel/popup.dart';
import 'package:manage_hotel/view/theme/app_colors.dart';
import 'package:manage_hotel/view/theme/fonts.dart';
import 'package:manage_hotel/view_model/tenant_viewModel/home_viewModel.dart';
import 'package:manage_hotel/view_model/theme_change_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: AppColors.primaryMaterialColor,
        scaffoldBackgroundColor: AppColors.homeBackgroundColor,
        textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: AppColors.primaryTextTextColor
        ),
        appBarTheme: const AppBarTheme(
            color: AppColors.whiteColor,
            titleTextStyle: TextStyle(fontSize: 22,fontFamily: AppFonts.sfProDisplayMedium,color: AppColors.primaryTextTextColor)
        ),),
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      // ),
      initialRoute: AppRouteName.splashScreen,
      onGenerateRoute: AppRoutes.generateRoute,

      //  home: TenantHomeScreen(),

      // home: MyHome(),
    );
  }
}
