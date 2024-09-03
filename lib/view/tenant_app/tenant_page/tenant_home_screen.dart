import 'package:flutter/material.dart';
import 'package:hotel_manage/utils/components/app_colors.dart';
import 'package:hotel_manage/utils/components/text_style.dart';
import 'package:hotel_manage/utils/routes/routes_name.dart';
import 'package:hotel_manage/utils/tenant_app_utils/appBar_navBar/custom_appbar.dart';
import 'package:hotel_manage/utils/tenant_app_utils/show_dialog_box.dart';




class TenantHomeScreen extends StatefulWidget {
  const TenantHomeScreen({super.key});

  @override
  State<TenantHomeScreen> createState() => _TenantHomeScreenState();
}

class _TenantHomeScreenState extends State<TenantHomeScreen>
    with TickerProviderStateMixin {

  List<String> floorNameList = ["GROUND FLOOR","FIRST FLOOR","SECOND FLOOR","THIRD FLOOR","FOURTH FLOOR","FIFTH FLOOR","SIXTH FLOOR","SEVENTH FLOOR",
    "EIGHTH FLOOR","FOURTH FLOOR","FIFTH FLOOR","SIXTH FLOOR","SEVENTH FLOOR","EIGHTH FLOOR"];
  List<String> roomCountList = ["room : 102","room : 152","room : 152","room : 200","room : 15R","room : 241","room : 124","room : 141","room : 123",
  "room : 15R","room : 241","room : 124","room : 141","room : 123"];

  var time = DateTime.now();
  late AnimationController _animationController;
  late Animation _hotelTween, _iconTween,_colorsTween2;
  late Animation<Color?>  _colorsTween;
  late AnimationController _textAnimationController;

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
          end: Color(0xFFBBEEFF),   // Middle gradient color
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Color(0xFF99E0FF),   // Middle gradient color
          end: Colors.white,          // End color
        ),
      ),
    ]).animate(_animationController);

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
                              height: mq.height*0.3,width: double.infinity,
                              padding: EdgeInsets.fromLTRB(mq.width*0.03, mq.height*0.1, mq.height*0.03,0),
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
                              child: Container(
                                color: Colors.white,
                                child: Text("data "),
                              )

                            );
                          },
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
                          onTap: (){Navigator.pushNamed(context, AppRouteName.FloorOFDataScreen);},
                          child: Card(margin: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                            color: MyAppColors.tenantHomeCardColor,
                            surfaceTintColor: MyAppColors.tenantHomeCard2Color,
                            elevation: 1,
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(19))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15,bottom: 15,left: 25,right: 20),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(floorNameList[index],style: myTextStyle20(textColor: Colors.black,textFontWeight: FontWeight.w500),),
                                      Text(roomCountList[index],style: myTextStyle15(textColor: Colors.black,textFontWeight: FontWeight.w300),),
                                    ],
                                  ),

                                  IconButton(onPressed: (){showAddRoomDialog(context);}, icon: Icon(Icons.add))
                                ],
                              ),
                            ),
                          ),
                        );
                      },childCount: 10))
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
                  colorsTween2: _colorsTween2,
                  hotelTween: _hotelTween,
                  iconTween: _iconTween,
                  addIconButton: () {
                    showAddFloorDialog(context);
                  },
                  menuIconButton: () {},
                ),
              ],
            ),
          ),
    );
  }
}
