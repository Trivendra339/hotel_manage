import 'package:manage_hotel/utils/app_export.dart';
import 'package:manage_hotel/view/widgets/top_bar/top_bar.dart';

class RoomDataScreen extends StatefulWidget {
  const RoomDataScreen({super.key});

  @override
  State<RoomDataScreen> createState() => _RoomDataScreenState();
}

class _RoomDataScreenState extends State<RoomDataScreen>{
  var time = DateTime.now();

  List mySmartDevice = [
    ['Smart Light', "assets/smart_device/smart-_light.png", true],
    ['Smart TV', "assets/smart_device/smart-tv.png", false],
    ['Smart AC', "assets/smart_device/smart_air-conditioner.png", false],
    ['Smart Fan', "assets/smart_device/smart_fan.png", false],
    ['Smart Fan', "assets/smart_device/smart_fan.png", false],
    ['Smart Fan', "assets/smart_device/smart_fan.png", false],
    ['Smart Fan', "assets/smart_device/smart_fan.png", false],
    ['Smart Light', "assets/smart_device/smart-_light.png", true],
    ['Smart TV', "assets/smart_device/smart-tv.png", false],
    ['Smart AC', "assets/smart_device/smart_air-conditioner.png", false],
    ['Smart Fan', "assets/smart_device/smart_fan.png", false],
    ['Smart Fan', "assets/smart_device/smart_fan.png", false],
    ['Smart Fan', "assets/smart_device/smart_fan.png", false],
    ['Smart Fan', "assets/smart_device/smart_fan.png", false],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevice[index][2] = value;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  final roomViewModel = Provider.of<RoomDataViewmodel>(context);

     late Size mq = MediaQuery.of(context).size * 1;
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
                padding: const EdgeInsets.only(top: 9),
                decoration: const BoxDecoration(
                    color: AppColors.homeBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                    )
                ),
                child: GridView.builder(gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    childAspectRatio: 1.2
                ),
                    itemCount: mySmartDevice.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding:
                        const EdgeInsets.only(left: 13, top: 15, right: 15),
                        child: SmartDevicesBox(
                          //  mySmartDeviceList: mySmartDevice,
                          smartDeviceName: mySmartDevice[index][0],
                          iconPath: mySmartDevice[index][1],
                          powerOn: mySmartDevice[index][2],
                          roomName: 'Bedroom',
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
}

// Top AppBar Widget :-
Widget appSliverToBoxAdapter({
  context,
}) {
  final mq = MediaQuery.of(context).size;
  return SliverToBoxAdapter(
      child: Container(
    decoration: const BoxDecoration(
        color: Color(0xe462a3da),
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
            )),
        const SizedBox(
          height: 50,
        ),
        Text(
          "Tue,September 10,2024",
          style: myTextStyle20(
              textFontWeight: FontWeight.bold, textColor: Colors.white),
        ),
        Text(
          "11:30 PM",
          style: myTextStyle20(
              textFontWeight: FontWeight.bold, textColor: Colors.white),
        ),
      ],
    ),
  ));
}

// Smart Devices Item Design Class :-
class SmartDevicesBox extends StatelessWidget {
  final String roomName;
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;

  // final mySmartDeviceList;
  // void Function(bool)? onChanged;

  const SmartDevicesBox({
    super.key,
    //   required this.mySmartDeviceList,
    required this.roomName,
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerOn,
    //  this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    //  final roomViewModel = Provider.of<RoomDataViewmodel>(context);
    ValueNotifier<bool> onButton = ValueNotifier<bool>(false);
    late Size mq = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.listBackgroundColor,
            borderRadius: BorderRadius.circular(18),
          border: Border.all(width: 2,color: AppColors.listBackgroundColor)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 9.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ValueListenableBuilder(
                    valueListenable: onButton,
                    builder: (context, value, child) {
                      return Container(
                          height: 45,
                          width: 45,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: onButton.value
                                  ? AppColors.blackColor
                                  : Color(0xFFEEEDF6),
                              borderRadius: BorderRadius.circular(11)),
                          child: Image.asset(
                            iconPath,
                            color: onButton.value
                                ? AppColors.whiteColor
                                : AppColors.blackColor,
                          ));
                    }),
                SizedBox(
                  width: mq.width / 7.5,
                ),
                ValueListenableBuilder(
                    valueListenable: onButton,
                    builder: (context, value, child) {
                      return Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey[300], shape: BoxShape.circle),
                        child: GestureDetector(
                            onTap: () {
                              onButton.value = !onButton.value;
                              // roomViewModel.powerBtn();
                            },
                            child: SizedBox(
                              height: 27,
                              width: 27,
                              child: onButton.value
                                  ? Image.asset(
                                  "assets/icons/PowerIcon_GREEN.png")
                                  : Image.asset(
                                  "assets/icons/PowerIcon_RED.png"),
                            )),
                      );
                    }),

                // CupertinoSwitch(
                //   value: powerOn,
                //   onChanged: onChanged,
                //   activeColor: MyAppColors.blackColor,
                // ),
              ],
            ),
            SizedBox(
              height: mq.height / 60,
            ),
            Text(
              roomName,
              style: myTextStyle15(textColor: AppColors.blackColor),
            ),
            Text(
              smartDeviceName,
              style: myTextStyle15(textColor: AppColors.blackColor),
            ),
            ValueListenableBuilder(
                valueListenable: onButton,
                builder: (context, value, child) {
                  return Text(onButton.value ? "on" : "of");
                }),
          ],
        ),
      ),
    );
  }

}
