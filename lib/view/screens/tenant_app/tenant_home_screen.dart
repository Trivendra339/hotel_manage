import 'package:manage_hotel/utils/app_export.dart';
import 'package:manage_hotel/view/widgets/top_bar/top_bar.dart';
import 'package:manage_hotel/view_model/tenant_viewModel/home_viewModel.dart';


class TenantHomeScreen extends StatefulWidget {
  const TenantHomeScreen({super.key});

  @override
  State<TenantHomeScreen> createState() => _TenantHomeScreenState();
}

class _TenantHomeScreenState extends State<TenantHomeScreen> {
  // late CustomAnimationHelper _animationHelper;
  final TextEditingController _searchTextController = TextEditingController();
  final TextEditingController _addFloorController = TextEditingController();
  final TextEditingController _AddRoomController = TextEditingController();

  List<String> floorNameList = [
    "GROUND FLOOR",
    "FIRST FLOOR",
    "SECOND FLOOR",
    "THIRD FLOOR",
    "FOURTH FLOOR",
    "FIFTH FLOOR",
    "SIXTH FLOOR",
    "SEVENTH FLOOR",
    "EIGHTH FLOOR",
    "FOURTH FLOOR",
    "FIFTH FLOOR",
    "SIXTH FLOOR",
    "SEVENTH FLOOR",
    "EIGHTH FLOOR"
  ];
  List<String> roomCountList = [
    "room : 102",
    "room : 152",
    "room : 152",
    "room : 200",
    "room : 15R",
    "room : 241",
    "room : 124",
    "room : 141",
    "room : 123",
    "room : 15R",
    "room : 241",
    "room : 124",
    "room : 141",
    "room : 123"
  ];

  var time = DateTime.now();
  // List<String> repeatData = ["Once", "Daily", "Mon to Fri", "Once a Month"];
  // String repeatDataSelect = "Once";
  //
  // Widget content = TasksList();

  //BoardType currentBoardType = BoardType.list; // Default board type
  Widget content = TasksList(); // Default content set to TasksList view



  @override
  void initState() {
   // _animationHelper = CustomAnimationHelper(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
                  addFloor$RoomDialog(context, (){}, _addFloorController,1);
                },popupIconButton: (){

                },),

              ],
               ),

            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 8),
                decoration: const BoxDecoration(
                  color: AppColors.homeBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  )
                ),
                child: ListView.builder(
                  itemCount: floorNameList.length,
                    itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouteName.floorOFDataScreen);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.listBackgroundColor,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                              width: 2,
                              color: AppColors.listBackgroundColor
                          )
                      ),
                      // surfaceTintColor: Color(0xFFFDFDFD),
                      // elevation: 3,
                      //  surfaceTintColor: Colors.grey[100],
                      margin: const EdgeInsets.symmetric(vertical: 11, horizontal: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  floorNameList[index],
                                  style: myTextStyle20(
                                    textColor: Colors.black,
                                    textFontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  roomCountList[index],
                                  style: myTextStyle15(
                                    textColor: Colors.black,
                                    textFontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                addFloor$RoomDialog(context, () {},_AddRoomController,2);
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
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
   // _animationHelper.dispose();
    super.dispose();
  }

}





Widget appSliverToBoxAdapter({searchTextController,textFieldFocus,
  context,
}) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return SliverToBoxAdapter(
      child: Container(
    decoration: const BoxDecoration(
        color:  AppColors.secondaryColor,
        borderRadius:  BorderRadius.only(
            bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24))),
    height: height * 0.4,
    width: double.infinity,
    padding: EdgeInsets.fromLTRB(
      width / 30,
      height / 10,
      width / 30,
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
            controller: searchTextController,
            focusNode: textFieldFocus,
            decoration: InputDecoration(
                hintText: "Search in floor",
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none),
          ),
        ),
        SizedBox(
          height: height / 40,
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

Widget appSliverGrid(
    {context, required List<String> floorName, required List roomName}) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return SliverGrid(
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.2),
    delegate: SliverChildBuilderDelegate((context, index) {
      return Padding(
        padding: const EdgeInsets.all(9.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRouteName.floorOFDataScreen);
          },
          child: GridTile(
              child: Card(
            color: Color(0xFFEEEDF6),
            surfaceTintColor: Color(0xFFFDFDFD),
            elevation: 3,
            shadowColor: Colors.black,
            child: Padding(
              padding: const EdgeInsets.only(left: 6.0, top: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Image.asset(height: 50,width: 45,
                      //     "assets/images/SignUp_LOGO.jpg"),

                      SizedBox(
                        height: height / 15,
                      ),
                      SizedBox(
                          width: width / 4,
                          child: Text(
                            floorName[index],
                            style: TextStyle(),
                            maxLines: 2,
                          )),
                      SizedBox(
                        width: width / 25,
                      ),
                      IconButton(
                          onPressed: () {
                            // showAddRoomDialog(context, () {});
                          },
                          icon: Icon(Icons.add))
                    ],
                  ),
                  SizedBox(
                    height: height / 95,
                  ),
                  Text(roomName[index]),
                ],
              ),
            ),
          )),
        ),
      );
    }, childCount: floorName.length),
  );
}

Widget appSliverList(
    {context, required List<String> floorName, required List roomName,Function? removeFocus,Function? disposeFocus}) {

  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        return GestureDetector(
          onTap: () {
            removeFocus;
            disposeFocus;
            Navigator.pushNamed(context, AppRouteName.floorOFDataScreen);
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.listBackgroundColor,
              borderRadius: BorderRadius.circular(24),
               border: Border.all(
                width: 2,
              color: AppColors.listBackgroundColor
            )
            ),
            // surfaceTintColor: Color(0xFFFDFDFD),
            // elevation: 3,
          //  surfaceTintColor: Colors.grey[100],
            margin: EdgeInsets.symmetric(vertical: 11, horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        floorName[index],
                        style: myTextStyle20(
                          textColor: Colors.black,
                          textFontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        roomName[index],
                        style: myTextStyle15(
                          textColor: Colors.black,
                          textFontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      childCount: 10,
    ),
  );
}


/* DropdownButton(
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      dropdownColor: Color(0xff3f4a57),
                      value: repeatDataSelect,
                      items: repeatData
                          .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style:const TextStyle(color: Colors.white, fontSize: 18),
                              )))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          repeatDataSelect = value.toString();
                        });
                      },
                    ) */