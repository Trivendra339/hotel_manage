import 'package:flutter/material.dart';
import 'package:hotel_manage/utils/components/app_colors.dart';
import 'package:hotel_manage/utils/tenant_app_utils/appBar_navBar/custom_navbar.dart';
import 'package:hotel_manage/view/tenant_app/tenant_page/roomrOF_data_screen.dart';
import 'package:intl/intl.dart';
import '../../../utils/components/text_style.dart';
import '../../../utils/tenant_app_utils/appBar_navBar/custom_appbar.dart';
import '../../../utils/tenant_app_utils/show_dialog_box.dart';

class FloorOF_Data_Screen extends StatefulWidget {
  const FloorOF_Data_Screen({super.key});

  @override
  State<FloorOF_Data_Screen> createState() => _FloorOF_Data_ScreenState();
}

class _FloorOF_Data_ScreenState extends State<FloorOF_Data_Screen> with TickerProviderStateMixin{

  List<String> roomNameList = ['Bedroom',"Living Room","Falana Room","Dhemkana Room","bhaiya ke room","Bhai ke room","didi ke room","mera room",
    'Bedroom',"Living Room","Falana Room","Dhemkana Room","bhaiya ke room","Bhai ke room","didi ke room","mera room"];

  var time = DateTime.now();
  late AnimationController _animationController;
  late Animation _hotelTween, _iconTween,_colorsTween2;
  late Animation<Color?>  _colorsTween;
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

    _colorsTween2 = ColorTween(begin: Colors.transparent, end: Colors.white).animate(_animationController);

    _colorsTween = TweenSequence<Color?>([
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Color(0xff1f91ff), // Start color
          end: Color(0xFFBBEEFF),   // // Middle gradient color
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Color(0xFF99E0FF),   // Middle gradient color
          end: Colors.white,            // End color
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
                      builder: (context, child){
                        return Container(
                          padding: EdgeInsets.fromLTRB(18, 130, 15, 30),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    _colorsTween.value!,
                                    Colors.white.withOpacity(0.9)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter
                              ),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat(DateFormat.HOUR_MINUTE_SECOND)
                                    .format(time),
                                style: myTextStyle25(textFontWeight: FontWeight.bold,textColor: Colors.black),
                              ),
                              Text(
                                "Date This",
                                style: myTextStyle25(textFontWeight: FontWeight.bold,textColor: Colors.black),
                              )
                            ],
                          ),

                        );
                      },
                    ),

                  ),

                  // grid view item
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 250, crossAxisSpacing: 0,mainAxisSpacing: 15,childAspectRatio: 1.7),
                    delegate: SliverChildBuilderDelegate(
                            (context, index){
                          return Padding(
                            padding: const EdgeInsets.only(top: 8,left: 10,right: 10),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, (MaterialPageRoute(builder: (context)=>RoomOF_Data_Screen())));
                              },
                              child: GridTile(child: Card(
                                color: MyAppColors.tenantHomeCardColor,
                                surfaceTintColor: MyAppColors.tenantHomeCard2Color,
                                elevation: 1,
                                shadowColor: Colors.black,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        SizedBox(height: 15,),
                                        Text(roomNameList[index],style: myTextStyle20(textColor: Colors.black,textFontWeight: FontWeight.bold),),

                                        SizedBox(height: 10,),
                                        Text("room item",textAlign: TextAlign.start,style: myTextStyle15(textColor: Colors.black,textFontWeight: FontWeight.w500),),
                                      ],
                                    ),
                                ),
                              )),
                            ),
                          );
                        },
                        childCount: roomNameList.length
                    ),
                  )
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
                  animationController: _animationController, context: context,
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
