import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_manage/res/components/text_style.dart';
import 'package:hotel_manage/utils/routes/routes_name.dart';
import 'package:hotel_manage/utils/utils.dart';
import 'package:hotel_manage/view/auth_page/demo_signUp_view.dart';
import 'package:hotel_manage/view/auth_page/login_view.dart';

import '../../res/components/round_button.dart';

class Login_Screen2 extends StatefulWidget {
  const Login_Screen2({super.key});

  @override
  State<Login_Screen2> createState() => _Login_Screen2State();
}

class _Login_Screen2State extends State<Login_Screen2> {

  ValueNotifier<bool> _obSecurePassword = ValueNotifier<bool>(true);
  final TextEditingController _emailCont = TextEditingController();
  final TextEditingController _passwordCont = TextEditingController();

  var tenantEmail;
  var tnantePD;

 var adminEmail;
 var adminPD;

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _obSecurePassword.dispose();
    _emailCont.dispose();
    _passwordCont.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

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
          padding:  EdgeInsets.symmetric(vertical: mq.height*0.08,horizontal: mq.width*0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Log In",style:  myTextStyle30(textColor: Colors.black87,textFontWeight: FontWeight.bold),),
              Text("Welcome back! Please enter your details",style: myTextStyle15(textColor: Colors.black26,textFontWeight: FontWeight.w600),),
        
               SizedBox(height: mq.height*0.06,),
        
          TextFormField(
            controller: _emailCont,
            focusNode: emailFocusNode,
            decoration:  InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7)
              ),
              labelText: "Email",
              prefixIcon: Icon(Icons.email_outlined)
            ),
            onFieldSubmitted: (v){
              Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
            },
          ),
        
               SizedBox(height: mq.height * 0.04,),
        
              ValueListenableBuilder(valueListenable: _obSecurePassword,
                  builder: (context,value,child){
                return  TextFormField(
                  controller: _passwordCont,
                  focusNode: passwordFocusNode,
                  obscureText: _obSecurePassword.value,
                  decoration:  InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)
                      ),
                    labelText: "Password",
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
                 children: [
                 Text("Remember for 30 days",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.black38)),
                 Text("Forgot password",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,))
               ],),

        
               SizedBox(height: mq.height*0.07,),
        
               MyRoundButtonFiled(title: "Continue",onPress: (){

                 if(_emailCont.text.isEmpty){
                   Utils.flushBarMessage(message: "Please enter your email",icon: Icons.error, context: context);
                 }else if(_passwordCont.text.isEmpty){
                   Utils.flushBarMessage(message: "Please enter your Password",icon: Icons.error, context: context);
                 }else if(_passwordCont.text.length < 6){
                   Utils.flushBarMessage(message: "Please enter 6 digit password",icon: Icons.error, context: context);
                 }
                 if(_emailCont.text.isNotEmpty && _passwordCont.text.isNotEmpty && _passwordCont.text.length > 5){
                   if(tenantEmail == "tenant" && tnantePD == "56789"){
                     Navigator.pushNamed(context, RouteName.SignUp_view2);
                   }else if(adminEmail == "admin" && adminPD == "12345"){
                     Navigator.pushNamed(context, RouteName.AdminHomeView);
                   }else{
                     Utils.flushBarMessage(message: "pls enter correct Id and password", context: context);
                   }
                 }

               },),
        
              SizedBox(height: mq.height*0.03,),
        
              MyRoundButtonOutLine(title: "SignUp", onPress: (){
                Navigator.pushNamed(context, RouteName.SignUp_view2);
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
