import 'package:flutter/material.dart';
import 'package:hotel_manage/utils/routes/routes.dart';
import 'package:hotel_manage/utils/routes/routes_name.dart';
import 'package:hotel_manage/view_model/tenant_viewModel/tenant_viewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TenantHomeViewModel>(
      create: (context)=> TenantHomeViewModel(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff1f91ff)),
        useMaterial3: true,
      ),
      initialRoute: AppRouteName.TenantHomeScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    ),
    );
  }
}

