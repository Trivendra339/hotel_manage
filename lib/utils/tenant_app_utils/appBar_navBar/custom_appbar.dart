import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget {

  var time = DateTime.now();

  AnimationController animationController;
  Animation colorsTween,colorsTween2,hotelTween,iconTween;
  Function()? addIconButton;
  Function()? menuIconButton;

  CustomAppBar({super.key, 
    required this.animationController,
  required this.colorsTween,
    required this.colorsTween2,
  required this.hotelTween,
  required this.iconTween,
    required this.addIconButton,
    required this.menuIconButton
});

  @override
  Widget build(BuildContext context) {
  /*  return Container(
      height: 90,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context,child)=>AppBar(
         backgroundColor: colorsTween.value,
          elevation: 0,
          title: Row(
            children: [
              Text("My Hotel",style: TextStyle(color: hotelTween.value,fontSize: 20,fontWeight: FontWeight.bold),),
              Icon(Icons.arrow_drop_down,color: iconTween.value,)
            ],
          ),
          leading: Icon(Icons.qr_code,color: iconTween.value,),
          actions: [
            IconButton(onPressed: addIconButton, icon: Icon(Icons.add,color: iconTween.value,)),
            IconButton(onPressed: menuIconButton,icon: Icon(Icons.more_vert_outlined,color: iconTween.value,))
          ],
        ),
      ),
    ); */

    return SizedBox(
      height: 90,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorsTween.value, Colors.white.withOpacity(0)], // Set your gradient colors here
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.0],
              ),
            ),
            child: AppBar(
                  backgroundColor: colorsTween2.value, // Make AppBar background transparent
                  elevation: 0,
                  title: Row(
                    children: [
                      Text(
                        "My Hotel",
                        style: TextStyle(
                          color: hotelTween.value,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: iconTween.value,
                      )
                    ],
                  ),
                  leading: Icon(
                    Icons.qr_code,
                    color: iconTween.value,
                  ),
                  actions: [
                    IconButton(
                      onPressed: addIconButton,
                      icon: Icon(
                        Icons.add,
                        color: iconTween.value,
                      ),
                    ),
                    IconButton(
                      onPressed: menuIconButton,
                      icon: Icon(
                        Icons.more_vert_outlined,
                        color: iconTween.value,
                      ),
                    ),
                  ],
                ),
          );
        },
      ),
    );


  }
}

