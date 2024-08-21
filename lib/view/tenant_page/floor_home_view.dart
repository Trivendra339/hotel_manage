import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:hotel_manage/res/components/text_style.dart';
import 'package:hotel_manage/utils/appBar_navBar/navBar.dart';
import 'package:hotel_manage/view_model/tenant_viewModel/tenant_viewModel.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../utils/appBar_navBar/customAppBar.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen>
    with TickerProviderStateMixin {
  var time = DateTime.now();
  late AnimationController _animationController;
  late Animation _colorsTween, _hotelTween, _iconTween;
  late AnimationController _textAnimationController;

  // NavBar Animation Controller
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

  // bool scrolllistner(ScrollNotification scrollNotification){
  //  bool scroll = false;
  //  if(scrollNotification.metrics.axis == Axis.vertical){
  //    _animationController.animateTo(scrollNotification.metrics.pixels/80);
  //    _textAnimationController.animateTo(scrollNotification.metrics.pixels);
  //    return scroll = true;
  //  }
  //  return scroll = false;
  // }

  // bool scrollListener(ScrollNotification scrollNotification) {
  //   if (scrollNotification.metrics.axis == Axis.vertical) {
  //     _animationController.animateTo(scrollNotification.metrics.pixels / 80);
  //     _textAnimationController.animateTo(scrollNotification.metrics.pixels);
  //
  //     // Control NavBar visibility based on scroll
  //     if (scrollNotification.metrics.pixels > 50) {
  //       _navBarAnimationController.reverse(); // Slide NavBar down
  //     } else {
  //       _navBarAnimationController.forward(); // Slide NavBar up
  //     }
  //     return true;
  //   }
  //   return false;
  // }

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

  void showAddRoomDialog() {
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
    final myProvide = Provider.of<TenantHomeViewModel>(context);

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
                            return Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: GridTile(child: Card(color: Color(
                                  0xFFF0F2F4),
                                surfaceTintColor: Colors.blueGrey,
                                shadowColor: Colors.black,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10,left: 12,right: 12),
                                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(Icons.home),
                                           IconButton(onPressed: (){showAddFoorDialog();}, icon: Icon(Icons.add))

                                          ],
                                        ),
                                      ),

                                      SizedBox(height: 15,),
                                      Text("GROUND FLOOR"),

                                      SizedBox(height: 10,),
                                      Text("Room : 303"),
                                    ],
                                  ),
                                ),
                              )),
                            );
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
                    backButton: () {},
                    home_outlinedButtn: () {},
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
