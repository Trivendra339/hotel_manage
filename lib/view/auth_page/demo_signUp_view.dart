import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_manage/res/components/text_style.dart';
import 'package:hotel_manage/utils/routes/routes_name.dart';
import 'package:hotel_manage/utils/utils.dart';
import 'package:hotel_manage/view/auth_page/demo_enter_code.dart';
import 'package:hotel_manage/view/auth_page/login_view.dart';

import '../../res/components/round_button.dart';

class SignUp_Screen2 extends StatefulWidget {
  const SignUp_Screen2({super.key});

  @override
  State<SignUp_Screen2> createState() => _SignUp_Screen2State();
}

class _SignUp_Screen2State extends State<SignUp_Screen2> {

  ValueNotifier<bool> obSecurePassword = ValueNotifier<bool>(true);

  final TextEditingController _nameCont = TextEditingController();
  final TextEditingController _phoneNumberCont = TextEditingController();
  final TextEditingController _passwordCont = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode phoneNumberFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height * 1;
    late Size mq = MediaQuery.of(context).size * 1;
    return Scaffold(
        appBar: AppBar(title: TextButton(onPressed: (){
          Navigator.pushNamed(context, RouteName.Login_Signup_view2);
        },child: const Icon(Icons.arrow_back),),automaticallyImplyLeading: false,),
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: mq.height*0.04,horizontal: mq.width*0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Create account",style: myTextStyle30(textColor: Colors.black87,textFontWeight: FontWeight.bold),),
                Text("Sign up and start getting fit",style: myTextStyle15(textColor: Colors.black26,textFontWeight: FontWeight.w600),),

                SizedBox(height: mq.height*0.05,),

                TextFormField(
                  controller: _nameCont,
                  focusNode: nameFocusNode,
                  decoration:  InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)
                      ),
                      labelText: "Name",
                      prefixIcon: Icon(Icons.email_outlined)
                  ),
                  onFieldSubmitted: (v){
                    Utils.fieldFocusChange(context, nameFocusNode, phoneNumberFocusNode);
                  },
                ),

                SizedBox(height: mq.height*0.04,),

                TextFormField(
                  controller: _phoneNumberCont,
                  focusNode: phoneNumberFocusNode,
                  decoration:  InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)
                      ),
                      labelText: "Phone number",
                      prefixIcon: Icon(Icons.phone)
                  ),
                  onFieldSubmitted: (v){
                    Utils.fieldFocusChange(context, phoneNumberFocusNode, passwordFocusNode);
                  },
                ),

                SizedBox(height: mq.height * 0.04,),

                ValueListenableBuilder(valueListenable: obSecurePassword,
                    builder: (context,value,child){
                      return  TextFormField(
                        controller: _passwordCont,
                        focusNode: passwordFocusNode,
                        obscureText: obSecurePassword.value,
                        decoration:  InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7)
                            ),
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock_open_outlined),
                            suffixIcon: InkWell(onTap: (){
                              obSecurePassword.value =! obSecurePassword.value;
                            },
                                child: Icon(obSecurePassword.value ? Icons.visibility_off_outlined:Icons.visibility_outlined))
                        ),
                      );
                    }),




                SizedBox(height: mq.height*0.06,),

                MyRoundButtonFiled(title: "Continue",onPress: (){

                  if(_nameCont.text.isEmpty){
                    Utils.flushBarMessage(message: "Please enter your name",icon: Icons.error, context: context);
                  }else if(_phoneNumberCont.text.isEmpty) {
                    Utils.flushBarMessage(message: "Please enter your phone number", icon: Icons.error, context: context);
                  }else if(_passwordCont.text.isEmpty){
                    Utils.flushBarMessage(message: "Please enter your password",icon: Icons.error, context: context);
                  }else if(_passwordCont.text.length < 6){
                    Utils.flushBarMessage(message: "Please enter 6 digit password",icon: Icons.error, context: context);
                  }
                  if(_nameCont.text.isNotEmpty && _phoneNumberCont.text.isNotEmpty &&  _phoneNumberCont.text.isNotEmpty &&_passwordCont.text.length > 5){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Enter_Code2()));
                  }
                },),

                SizedBox(height: mq.height*0.03,),

                MyRoundButtonOutLine(title: "Login", onPress: (){
                  Navigator.pushNamed(context, RouteName.Login_view2);
                }),

                SizedBox(height: mq.height*0.03,),



                Row(
                  children: [
                    Expanded(
                        child: Divider(thickness: 1,endIndent: 10,color: Colors.black,)),
                    Text("OR"),
                    Expanded(
                        child: Divider(thickness: 1,indent: 10,color: Colors.black,)),
                  ],
                ),

                SizedBox(height: mq.height*0.03,),

                MyRoundButtonOutLine(iconData: Icons.devices_other,title: "Sign up with Google", onPress: (){}),

                SizedBox(height: mq.height*0.03,),
                Text("By continung you agree to our Terms of service and privacy policy",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.black38))
              ],

            ),
          ),
        )
    );
  }
}
