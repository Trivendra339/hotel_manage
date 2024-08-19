import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:hotel_manage/res/components/text_style.dart';
import 'package:intl/intl.dart';

import '../../utils/appBar_navBar/customAppBar.dart';

class Floor_Data_Screen extends StatefulWidget {
  const Floor_Data_Screen({super.key});

  @override
  State<Floor_Data_Screen> createState() => _Floor_Data_ScreenState();
}

class _Floor_Data_ScreenState extends State<Floor_Data_Screen> with TickerProviderStateMixin {

  var time = DateTime.now();
  late AnimationController _animationController;
  late Animation _colorsTween,_hotelTween,_iconTween;
  late AnimationController _textAnimationController;

  @override
  void initState() {
    _animationController =AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorsTween = ColorTween(begin: Colors.blue.shade400, end: Colors.white).animate(_animationController);
    _hotelTween = ColorTween(begin: Colors.white, end: Colors.black).animate(_animationController);
    _iconTween = ColorTween(begin: Colors.white, end: Colors.black).animate(_animationController);
    _textAnimationController = AnimationController(vsync: this, duration: Duration(seconds: 0));
    super.initState();
  }

  bool scrolllistner(ScrollNotification scrollNotification){
    bool scroll = false;
    if(scrollNotification.metrics.axis == Axis.vertical){
      _animationController.animateTo(scrollNotification.metrics.pixels/80);
      _textAnimationController.animateTo(scrollNotification.metrics.pixels);
      return scroll = true;
    }
    return scroll = false;
  }

  void showAlertDialog(){
    showDialog(context: context,
        builder: (context){
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
            child: AlertDialog(
              title: Text("Add Floor"),
              content: TextField(
                decoration: InputDecoration(
                    hintText: "Enter Floor Name"
                ),
              ),
              actions: [
                TextButton(onPressed: (){Navigator.pop(context);}, child: const Text("Cancel")),
                TextButton(onPressed: (){}, child: const Text("Save")),
              ],
            ),
          );
        });
  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
        backgroundColor: Colors.white,

        body: NotificationListener(
          onNotification: scrolllistner,
          child: Stack(
            children: [
              Container(height: double.infinity,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(padding: EdgeInsets.fromLTRB(50, 87, 50, 10),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.blue.shade400,
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                                ),
                                child: Column(
                                  children: [
                                    Text(DateFormat(DateFormat.HOUR_MINUTE_SECOND).format(time),style: myTextStyle25(),),
                                    Text("date this",style: myTextStyle25(),)
                                  ],
                                ),
                              ),

                              Container(height: 500,color: Colors.yellow,),
                              Container(height: 500,color: Colors.red,),
                            ],
                          )
                        ],
                      ),
                    ),
                    CustomAppBar(animationController: _animationController, colorsTween: _colorsTween, hotelTween: _hotelTween, iconTween: _iconTween,addIconButton: (){showAlertDialog();},menuIconButton: (){},)
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
