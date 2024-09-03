import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_manage/utils/components/app_colors.dart';
import 'package:hotel_manage/utils/tenant_app_utils/show_dialog_box.dart';

import '../../../utils/components/text_style.dart';
import '../../../utils/tenant_app_utils/appBar_navBar/custom_appbar.dart';
import '../../../utils/tenant_app_utils/appBar_navBar/custom_navbar.dart';

class RoomOF_Data_Screen extends StatefulWidget {
  const RoomOF_Data_Screen({super.key});

  @override
  State<RoomOF_Data_Screen> createState() => _RoomOF_Data_ScreenState();
}

class _RoomOF_Data_ScreenState extends State<RoomOF_Data_Screen>
    with TickerProviderStateMixin {
  var time = DateTime.now();
  late AnimationController _animationController;
  late Animation _colorsTween, _hotelTween, _iconTween, _colorsTween2;
  late AnimationController _textAnimationController;

  // NavBar Animation Controller var
  late AnimationController _navBarAnimationController;
  late Animation<Offset> _navBarOffsetAnimation;
  bool isScrollingDown = false;
  double lastOffset = 0;

  List mySmartDevice = [
    ['Smart Light', "assets/smart_device/smart-_light.png", true],
    ['Smart TV', "assets/smart_device/smart-tv.png", false],
    ['Smart AC', "assets/smart_device/smart_air-conditioner.png", false],
    ['Smart Fan', "assets/smart_device/smart_fan.png", false],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevice[index][2] = value;
    });
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));

    _colorsTween2 = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(_animationController);

    _colorsTween = TweenSequence<Color?>([
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Color(0xff1f91ff), // Start color
          end: Color(0xFFBBEEFF), // Middle gradient color
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Color(0xFF99E0FF), // Middle gradient color
          end: Colors.white, // End color
        ),
      ),
    ]).animate(_animationController);

    _hotelTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController);
    _iconTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController);
    _textAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));

    // NavBar Animation Initialization
    _navBarAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _navBarOffsetAnimation =
        Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _navBarAnimationController, curve: Curves.easeInOut));
    super.initState();
  }

  bool scrollListener(ScrollNotification scrollNotification) {
    if (scrollNotification.metrics.axis == Axis.vertical) {
      double currentOffset = scrollNotification.metrics.pixels;

      if (currentOffset > lastOffset && !isScrollingDown) {
        // User is scrolling down
        isScrollingDown = true;
        _navBarAnimationController.reverse(); // Hide NavBar
      } else if (currentOffset < lastOffset && isScrollingDown) {
        // User is scrolling up
        isScrollingDown = false;
        _navBarAnimationController.forward(); // Show NavBar
      }

      lastOffset = currentOffset;

      // This part controls the app bar color transition
      _animationController.animateTo(scrollNotification.metrics.pixels / 80);
      _textAnimationController.animateTo(scrollNotification.metrics.pixels);

      return true;
    }
    return false;
  }

  void showAddFoorDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: AlertDialog(
              title: Text("Add Floor"),
              content: TextField(
                decoration: InputDecoration(hintText: "Enter Floor Name"),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
                TextButton(onPressed: () {}, child: const Text("Save")),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    late Size mq = MediaQuery.of(context).size * 1;
    return Scaffold(
      backgroundColor: MyAppColors.tenantHomeBackColor,
      body: NotificationListener(
        onNotification: scrollListener,
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(18, 110, 15, 30),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    _colorsTween.value!,
                                    Colors.white.withOpacity(0.9)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome,",
                                style: myTextStyle18(
                                    textColor: MyAppColors.blackColor),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Bedroom",
                                style: myTextStyle35(
                                    textColor: Colors.black,
                                    textFontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Smart Devices",
                                style: myTextStyle10(
                                    textColor: MyAppColors.blackColor),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  // grid view item:-
               /*   SliverGrid(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 250, childAspectRatio: 0.9),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return SmartDeviceBox(
                        smartDeviceName: mySmartDevice[index][0],
                        iconPath: mySmartDevice[index][1],
                        powerOn: mySmartDevice[index][2],
                        onChanged: (value) => powerSwitchChanged(value, index),
                      );
                    }, childCount: mySmartDevice.length),
                  ) */

                  // lIst view item:-
                  SliverList(delegate: SliverChildBuilderDelegate((context, index){

                    return Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: SmartDeviceBox(smartDeviceName: mySmartDevice[index][0],
                            iconPath: mySmartDevice[index][1],
                            powerOn: mySmartDevice[index][2],
                            onChanged: (value)=> powerSwitchChanged(value,index)),

                    );
                  },childCount: mySmartDevice.length))
                ],
              ),
            ),
            CustomAppBar(
              animationController: _animationController,
              colorsTween: _colorsTween,
              colorsTween2: _colorsTween2,
              hotelTween: _hotelTween,
              iconTween: _iconTween,
              addIconButton: () {
                showAddFloorDialog(context);
              },
              menuIconButton: () {},
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SlideTransition(
                position: _navBarOffsetAnimation,
                child: CustomNavBar(
                  animationController: _animationController,
                  context: context,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onChanged;

  SmartDeviceBox(
      {super.key,
      required this.smartDeviceName,
      required this.iconPath,
      required this.powerOn,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(padding: EdgeInsets.symmetric(vertical: 5),
                  height: 110,width: 70,
                  decoration: BoxDecoration(
                    color: powerOn? MyAppColors.blackColor : MyAppColors.tenantHomeBackColor,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(iconPath,height: 45,color: powerOn? MyAppColors.whiteColor : MyAppColors.blackColor,),
                      SizedBox(height: 7,),
                      Text(powerOn? "2" : "",style: TextStyle(color: powerOn? MyAppColors.whiteColor : MyAppColors.blackColor,),)
                    ],
                  ),
                ),


              Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(powerOn? "Connected" : "Not Connected"),
                    SizedBox(height: 10,),
                    Text(smartDeviceName,style: myTextStyle20(textFontWeight: FontWeight.bold,textColor: MyAppColors.blackColor),)
                  ],
              ),

              SizedBox(width: 20,),
              
              CupertinoSwitch(
                    value: powerOn,
                    onChanged: onChanged,
                activeColor: MyAppColors.blackColor,
                ),
            ],


    );
  }
}