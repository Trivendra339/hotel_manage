import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_hotel/utils/tenant_app_utils/appbar/my_costom_appbar.dart';
import 'package:manage_hotel/utils/tenant_app_utils/show_dialog_box.dart';
import 'package:manage_hotel/view/theme/text_style.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
 // final ValueNotifier<bool> _themeChangeBtn = ValueNotifier<bool>(false);


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

  @override
  Widget build(BuildContext context) {
  //  final themeChanger = Provider.of<ThemeChanger>(context);
   // late Size mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            MyCustomAppbar(context: context,addIconButton: (){}, drawerIconButton: (){ Scaffold.of(context).openEndDrawer();}, PopupIconButton: (){}),

            SizedBox(height: 30,),
            Text("Floor List",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            SizedBox(child: Divider(),),
            
            
            Expanded(
              child: ListView.builder(itemCount: 10,
                  itemBuilder: (context, index){
                return Container(
                  height: 90,
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "floorName[index]",
                            style: myTextStyle20(
                              textColor: Colors.white,
                              textFontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                           " roomName[index]",
                            style: myTextStyle15(
                              textColor: Colors.white,
                              textFontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          // showAddRoomDialog(context, () {});
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),

                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

/*

Stack(
        children: [
          Stack(
            children: [
             // Container(
              //   height: MediaQuery.of(context).size.height / 2.4,
              //   width: MediaQuery.of(context).size.width,
              //   decoration: const BoxDecoration(
              //       color: Colors.white
              //   ),
              // ),
              Container(
                height: mq.height / 2.7,
                width: mq.width,
                decoration: const BoxDecoration(
                    color: MyAppColors.loginPage,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(60))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Image.asset(color: Colors.white,
                          "assets/images/user_login_or_authenticate.png"),
                    ),
                    Text("Welcome back! Please enter your details",style: myTextStyle15(textColor: Colors.white,textFontWeight: FontWeight.bold),),
                  ],
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: mq.width,
              height: mq.height / 1.588,
              decoration: const BoxDecoration(
                color: MyAppColors.loginPage,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding:  EdgeInsets.fromLTRB(mq.width * 0.05, mq.height * 0.05, mq.width * 0.05, 0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.588,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(60))
              ),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email Widget :-
                      Text("Email",style:  myTextStyle15(textColor: Colors.black87,textFontWeight: FontWeight.bold),),
                      SizedBox(height: mq.height / 180,),
                      TextFormField(
                        controller: _emailCont,
                        focusNode: emailFocusNode,
                        decoration:  InputDecoration(

                            hintText: "Enter your email",
                            prefixIcon: Icon(Icons.email_outlined)
                        ),
                        onFieldSubmitted: (v){
                          Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
                        },
                      ),


                      SizedBox(height: mq.height / 30,),

                      // Password Widget :-
                      Text("Password",style:  myTextStyle15(textColor: Colors.black87,textFontWeight: FontWeight.bold),),
                      SizedBox(height: mq.height / 180,),
                      ValueListenableBuilder(valueListenable: _obSecurePassword,
                          builder: (context,value,child){
                            return  TextFormField(
                              controller: _passwordCont,
                              focusNode: passwordFocusNode,
                              obscureText: _obSecurePassword.value,
                              decoration:  InputDecoration(

                                  hintText: "Enter your password",
                                  prefixIcon: Icon(Icons.lock_open_outlined),
                                  suffixIcon: InkWell(onTap: (){
                                    _obSecurePassword.value =! _obSecurePassword.value;
                                  },
                                      child: Icon(_obSecurePassword.value ? Icons.visibility_off_outlined:Icons.visibility_outlined))
                              ),
                            );
                          }),

                      SizedBox(height: mq.height*0.01,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Remember ",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.black38)),
                          Text("Forgot password",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: MyAppColors.loginPage))
                        ],),


                      SizedBox(height: mq.height / 20,),

                      MyRoundButtonFiled(title: "Continue",onPress: (){

                        if(_emailCont.text.isEmpty){
                          Utils.flushBarMessage(message: "Please enter your email",icon: Icons.error, context: context);
                        }else if(_passwordCont.text.isEmpty){
                          Utils.flushBarMessage(message: "Please enter your Password",icon: Icons.error, context: context);
                        }else if(_passwordCont.text.length <= 2){
                          Utils.flushBarMessage(message: "Please enter 6 digit password",icon: Icons.error, context: context);
                        }
                        if(_emailCont.text.isNotEmpty && _passwordCont.text.isNotEmpty && _passwordCont.text.length <= 2 ){
                          if(_emailCont.value.text == tenantEmail && _passwordCont.value.text == tenantPD){
                            Navigator.pushNamed(context, AppRouteName.TenantHomeScreen);
                          }else if(_emailCont.value.text == adminEmail && _passwordCont.value.text == adminPD){
                            Navigator.pushNamed(context, AppRouteName.AdminHomeScreen);
                          }else{
                            Utils.flushBarMessage(message: "pls enter correct Id and password", context: context);
                          }
                        }

                      },),

                      SizedBox(height: mq.height / 50),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: const [
                            Expanded(
                                child: Divider(thickness: 1,endIndent: 10,color: Colors.black,)),
                            Text("OR"),
                            Expanded(
                                child: Divider(thickness: 1,indent: 10,color: Colors.black,)),
                          ],
                        ),
                      ),

                      SizedBox(height: mq.height / 8,),


                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account ?"),
                          TextButton(onPressed: (){
                            Navigator.pushNamed(context, AppRouteName.SignUpScreen);
                          }, child: Text("Sign up",style: myTextStyle15(textColor: MyAppColors.loginPage,textFontWeight: FontWeight.bold),)),
                        ],
                      )
                    ],

                  ),

              ),
            ),
          )
        ],
      ),

 */
