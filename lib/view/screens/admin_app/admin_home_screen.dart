import 'package:manage_hotel/utils/app_export.dart';


class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         // add$UpdateUserDialog(context, (){},1);
        },
        child: Icon(Icons.add,color: AppColors.homeBackgroundColor,),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 35),
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
            Container(
                height: mq.height * 0.20,
                child: Column(
                  children: [
                    TopBar(addIconButton: (){
                     // add$UpdateUserDialog(context, (){}, 1,_controller,_focusNode);
                    },popupIconButton: (){

                    },),

                  ],
                )
            ),

            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 5.0),
                decoration: const BoxDecoration(
                    color: AppColors.homeBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                    )
                ),
                child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context,index){
                  return Container(
                    decoration: BoxDecoration(
                        color: AppColors.listBackgroundColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            width: 2,
                            color: AppColors.listBackgroundColor
                        )
                    ),
                    // surfaceTintColor: Color(0xFFFDFDFD),
                    // elevation: 3,
                    //  surfaceTintColor: Colors.grey[100],
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 12),
                    padding: const EdgeInsets.all(9),
                    child: Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name - Admir1 aaa",style: AppTextStyles.headline6.copyWith(color: AppColors.primaryColor)),
                                SizedBox(height: 5,),
                                Text("Email - Admir1@gmail.com"),
                                SizedBox(height: 5,),
                                Text("Phone - 123456789"),
                                SizedBox(height: 5,),
                                Text("Country - India"),
                              ],
                            ),

                            Column(
                              children: [
                                 IconButton(onPressed: (){
                                  // add$UpdateUserDialog(context, (){},2);
                                 }, icon: Image.asset(height: 25,width: 25,
                                     "assets/icons/edit_icon.png")),
                                 IconButton(onPressed: (){
                                 }, icon: Image.asset(height: 25,width: 25,
                                     "assets/icons/delete_icon.png"))
                              ],
                            )
                          ],
                        )
                      ],
                    )
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
