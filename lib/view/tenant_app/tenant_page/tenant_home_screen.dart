import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:hotel_manage/utils/routes/routes_name.dart';
import 'package:hotel_manage/utils/tenant_app_utils/show_dialog_box.dart';
import 'package:intl/intl.dart';

import '../../../utils/components/app_colors.dart';
import '../../../utils/components/text_style.dart';
import '../../../utils/tenant_app_utils/appBar_navBar/customAppBar.dart';


class Tenant_Home_Screen extends StatefulWidget {
  const Tenant_Home_Screen({super.key});

  @override
  State<Tenant_Home_Screen> createState() => _Tenant_Home_ScreenState();
}

class _Tenant_Home_ScreenState extends State<Tenant_Home_Screen>
    with TickerProviderStateMixin {
  var time = DateTime.now();
  late AnimationController _animationController;
  late Animation _colorsTween, _hotelTween, _iconTween;
  late AnimationController _textAnimationController;

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

    super.initState();
  }


  bool scrollListener(ScrollNotification scrollNotification) {
    if (scrollNotification.metrics.axis == Axis.vertical) {
      double currentOffset = scrollNotification.metrics.pixels;

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
                        padding: EdgeInsets.fromLTRB(15, 95, 15, 18),
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
                    SliverList(delegate: SliverChildBuilderDelegate((context, index){
                    /*  return Container(padding: EdgeInsets.only(top: 9,bottom: 9,left: 15,right: 15),
                        margin: EdgeInsets.symmetric(vertical: 12,horizontal: 15),
                        decoration: BoxDecoration(
                          color: Color(0xfff8fafb),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border(right: BorderSide(color: Colors.black),left: BorderSide(color: Colors.black),bottom: BorderSide(color: Colors.black),top: BorderSide(color: Colors.black))
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("First Floor",style: myTextStyle20(textColor: Colors.black),),
                            IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_outline))
                          ],
                        ),
                      );*/
                      return InkWell(
                        onTap: (){Navigator.pushNamed(context, MyRouteName.FloorOFDataScreen);},
                        child: Card(margin: EdgeInsets.symmetric(vertical: 12,horizontal: 15),
                          color: Colors.white,
                          shadowColor: Colors.black,
                          surfaceTintColor: Color(0xFF464e7f),
                          elevation: 2.8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(19))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8,bottom: 8,left: 25,right: 20),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("First Floor",style: myTextStyle20(textColor: Colors.black,textFontWeight: FontWeight.w500),),
                                IconButton(onPressed: (){showAddRoomDialog(context);}, icon: Icon(Icons.add))
                              ],
                            ),
                          ),
                        ),
                      );
                    },childCount: 20))
                    /*  SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250, crossAxisSpacing: 10,mainAxisSpacing: 10,childAspectRatio: 1.2),
                      delegate: SliverChildBuilderDelegate(
                          (context, index){
                            return Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, (MaterialPageRoute(builder: (context)=>Room_Data_Screen())));
                                },
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
                                             IconButton(onPressed: (){showAddRoomDialog(context);}, icon: Icon(Icons.add))

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
                              ),
                            );
                          },
                        childCount: 20
                      ),
                    ) */
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
            ],
          ),
        ));
  }
}
