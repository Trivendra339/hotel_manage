import 'package:flutter/material.dart';
import 'package:hotel_manage/utils/routes/routes_name.dart';

class CustomNavBar extends StatelessWidget {

  AnimationController animationController;
  final BuildContext context;


  CustomNavBar({
    super.key,
    required this.animationController,
    required this.context
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: Duration(seconds: 1),
        curve: Curves.easeOut,
        child: Container(
          height: 50,
          margin: EdgeInsets.only(bottom: 1),
          decoration: BoxDecoration(
              color: Color(0xffeff0f4),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
              boxShadow: [BoxShadow(
                  color: Colors.black.withAlpha(15),
                  blurRadius: 20,
                  spreadRadius: 10),]
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             IconButton(onPressed: (){
               Navigator.pop(context);
             }, icon: Icon(Icons.arrow_back)),
              IconButton(onPressed: (){}, icon: Icon(Icons.search)),
              IconButton(onPressed: (){
                Navigator.pushNamedAndRemoveUntil(context, AppRouteName.TenantHomeScreen, (route)=> false);
                }, icon: Icon(Icons.home_outlined))
            ],
          ),
        )
    );
  }
}
