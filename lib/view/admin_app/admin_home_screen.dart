import 'package:flutter/material.dart';

class Admin_Home_Screen extends StatefulWidget {
  const Admin_Home_Screen({super.key});

  @override
  State<Admin_Home_Screen> createState() => _Admin_Home_ScreenState();
}

class _Admin_Home_ScreenState extends State<Admin_Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome Admin App"),
      ),
    );
  }
}
