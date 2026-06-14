import 'package:manage_hotel/utils/app_export.dart';
import 'package:manage_hotel/view/widgets/top_bar/top_bar.dart';

class FloorOFDataScreen extends StatefulWidget {
  const FloorOFDataScreen({super.key});

  @override
  State<FloorOFDataScreen> createState() => _FloorOFDataScreenState();
}

class _FloorOFDataScreenState extends State<FloorOFDataScreen>{
  List<String> roomNameList = [
    'Bedroom',
    "Living Room", 
    'Bedroom',
    "Living Room",
  ];


  List roomItemList = [111,654,45,,212];

  var time = DateTime.now();
  late CustomAnimationHelper _animationHelper;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  AppColors.primaryColor,
                  AppColors.secondaryColor
                ]
            )
        ),
        child: Column(
          children: [
            Column(
              children: [
                TopBar(addIconButton: (){
                },popupIconButton: (){

                },),

              ],
            ),

            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 9),
                decoration: const BoxDecoration(
                    color: AppColors.homeBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                    )
                ),
                child: GridView.builder(gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1.7
                ),
                    itemCount: 20,
                    itemBuilder: (context,index){
                  return Padding(
                    padding:
                    const EdgeInsets.only(top: 8, left: 10, right: 10),
                    child: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        Navigator.pushNamed(context, AppRouteName.roomOFDataScreen);
                      },
                      child: GridTile(
                          child: Container(
                            padding: EdgeInsets.only(left: 8.0),
                            decoration: BoxDecoration(
                                color: AppColors.listBackgroundColor,
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(width: 2,color: AppColors.listBackgroundColor)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const  SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  roomNameList[index],
                                  style: myTextStyle20(
                                      textColor: Colors.black,
                                      textFontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "room item",
                                  textAlign: TextAlign.start,
                                  style: myTextStyle15(
                                      textColor: Colors.black,
                                      textFontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          )),
                    ),
                  );
                    }),
              ),
            )

          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

}

Widget appSliverToBoxAdapter({
  context,
}) {
  late Size mq = MediaQuery.of(context).size;
  return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24))),
        height: mq.height * 0.4,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(
          mq.width / 30,
          mq.height / 10,
          mq.width / 30,
          0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 6.0),
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(11)),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search in floor",
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: mq.height / 40,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Floor List",
                  style: myTextStyle30(
                      textColor: Colors.white, textFontWeight: FontWeight.bold),
                )
            ),

            SizedBox(height: 50,),
            Text("Tue,September 10,2024",style: myTextStyle20(textFontWeight: FontWeight.bold,textColor: Colors.white),),
            Text("11:30 PM",style: myTextStyle20(textFontWeight: FontWeight.bold,textColor: Colors.white),),
          ],
        ),
      ));
}
