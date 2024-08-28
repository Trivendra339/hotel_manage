import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utils/components/text_style.dart';
import '../../../utils/tenant_app_utils/appBar_navBar/customAppBar.dart';
import '../../../utils/tenant_app_utils/appBar_navBar/navBar.dart';

class RoomOF_Data_Screen extends StatefulWidget {
  const RoomOF_Data_Screen({super.key});

  @override
  State<RoomOF_Data_Screen> createState() => _RoomOF_Data_ScreenState();
}

class _RoomOF_Data_ScreenState extends State<RoomOF_Data_Screen>
    with TickerProviderStateMixin {
  var time = DateTime.now();
  late AnimationController _animationController;
  late Animation _colorsTween, _hotelTween, _iconTween;
  late AnimationController _textAnimationController;

  // NavBar Animation Controller var
  late AnimationController _navBarAnimationController;
  late Animation<Offset> _navBarOffsetAnimation;
  bool isScrollingDown = false;
  double lastOffset = 0;


  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorsTween = ColorTween(begin: Colors.blue, end: Colors.white)
        .animate(_animationController);
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

    return Scaffold(
        backgroundColor: Colors.white,
        body: NotificationListener(
          onNotification: scrollListener,
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(50, 87, 50, 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(18),
                                bottomRight: Radius.circular(18))),
                        child: Column(
                          children: [
                            Text(
                              DateFormat(DateFormat.HOUR_MINUTE_SECOND)
                                  .format(time),
                              style: myTextStyle25(),
                            ),
                            Text(
                              "Date This",
                              style: myTextStyle25(),
                            )
                          ],
                        ),
                      ),
                    ),
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250, crossAxisSpacing: 10,mainAxisSpacing: 10,childAspectRatio: 1.2),
                      delegate: SliverChildBuilderDelegate(
                              (context, index){
                            return Text("data");
                          },
                          childCount: 20
                      ),
                    )
                  ],
                ),
              ),
              CustomAppBar(
                animationController: _animationController,
                colorsTween: _colorsTween,
                hotelTween: _hotelTween,
                iconTween: _iconTween,
                addIconButton: () {
                  showAddFoorDialog();
                },
                menuIconButton: () {},
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SlideTransition(
                  position: _navBarOffsetAnimation,
                  child: CustomNavBar(
                    animationController: _animationController,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
