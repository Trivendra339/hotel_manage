import 'package:flutter/material.dart';
import 'package:hotel_manage/utils/routes/routes_View_Page.dart';
import 'package:hotel_manage/utils/routes/routes_name.dart';

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

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RouteName.Splash_view,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

