import 'package:flutter/material.dart';
import 'package:hotel_manage/utils/routes/routes_name.dart';
import 'package:intl/intl.dart';
import '../../../utils/components/app_colors.dart';
import '../../../utils/components/text_style.dart';
import '../../../utils/tenant_app_utils/appBar_navBar/customAppBar.dart';
import '../../../utils/tenant_app_utils/appBar_navBar/navBar.dart';
import '../../../utils/tenant_app_utils/show_dialog_box.dart';

class FloorOF_Data_Screen extends StatefulWidget {
  const FloorOF_Data_Screen({super.key});

  @override
  State<FloorOF_Data_Screen> createState() => _FloorOF_Data_ScreenState();
}

class _FloorOF_Data_ScreenState extends State<FloorOF_Data_Screen> with TickerProviderStateMixin{

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
    _colorsTween = ColorTween(begin: Color(0xFF464e7f), end: Colors.white)
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
                          padding: EdgeInsets.fromLTRB(15, 98, 15, 15),
                          decoration: BoxDecoration(
                              color: Color(0xFF464e7f),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  DateFormat(DateFormat.HOUR_MINUTE_SECOND)
                                      .format(time),
                                  style: myTextStyle25(textColor: MyAppColors.blackColor),
                                ),
                                SizedBox(height: 9,),
                                Text(
                                  "Date This",
                                  style: myTextStyle25(textColor: MyAppColors.blackColor),
                                )
                              ],
                            ),
                          )
                      ),
                    ),
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250, crossAxisSpacing: 10,mainAxisSpacing: 10,childAspectRatio: 2.2),
                      delegate: SliverChildBuilderDelegate(
                              (context, index){
                            return Padding(
                              padding: const EdgeInsets.all(11.0),
                              child: InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, MyRouteName.RoomOFDataScreen);
                                },
                                child: GridTile(child: Card(
                                  color: Color(0xfff8fafb),
                                  shadowColor: Colors.black,
                                  surfaceTintColor: Color(0xFF464e7f),
                                  elevation: 2.5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text("Bad\nRoom",style: myTextStyle20(textColor: MyAppColors.blackColor),),)
                                  ),
                                )),
                              ),
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
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
