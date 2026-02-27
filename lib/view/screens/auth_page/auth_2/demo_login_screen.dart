import 'package:manage_hotel/utils/app_export.dart';
import 'package:manage_hotel/view/widgets/input_text_field.dart';


class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {

  final ValueNotifier<bool> _obSecurePassword = ValueNotifier<bool>(true);
  final TextEditingController _emailCont = TextEditingController();
  final TextEditingController _passwordCont = TextEditingController();

  var tenantEmail = "t";
  var tenantPD = "22";

  var adminEmail = "a";
  var adminPD = "11";

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

    final  height = MediaQuery.of(context).size.height * 1;
    final  width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

             const Text("Log In ✨", style: AppTextStyles.headline2),
              Text("Welcome back! Please enter your details !!",
                style: AppTextStyles.bodyText2.copyWith(color: AppColors.secondaryTextColor)),

              SizedBox(height: height / 30,),


              // Email Widget :-
             const Text("Email", style: AppTextStyles.headline6),

              SizedBox(height: height / 180,),

              InputTextField(controller: _emailCont,
                  focusNode: emailFocusNode,
                  onFiledSubmittedValue: (value){

                  },
                  onValidator: (value){
                return value.isEmpty ? 'Enter Email' : null ;
                  },
                  label: "Enter your email"),


              SizedBox(height: height * 0.01,),

              // Password Widget :-
             const Text("Password", style: AppTextStyles.headline6),

              SizedBox(height: height / 180,),
              ValueListenableBuilder(valueListenable: _obSecurePassword,
                  builder: (context, value, child) {
                    // return TextFormField(
                    //   controller: _passwordCont,
                    //   focusNode: passwordFocusNode,
                    //   obscureText: _obSecurePassword.value,
                    //   decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(9)
                    //       ),
                    //       hintText: "Enter your password",
                    //       prefixIcon: Icon(Icons.lock_open_outlined),
                    //       suffixIcon: InkWell(onTap: () {
                    //         _obSecurePassword.value =
                    //         !_obSecurePassword.value;
                    //       },
                    //           child: Icon(_obSecurePassword.value ? Icons
                    //               .visibility_off_outlined : Icons
                    //               .visibility_outlined))
                    //   ),
                    // );

                    return InputTextField(controller: _passwordCont,
                        focusNode: passwordFocusNode,
                        obscureText: _obSecurePassword.value,
                        suffixIcon: Icons.visibility_outlined,
                        onFiledSubmittedValue: (value){

                        },
                        onValidator: (value){
                          return value.isEmpty ? 'Enter Email' : null ;
                        },

                        label: "Enter your password");
                  }),

               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                   const Text("Remember ", style: AppTextStyles.bodyText2),

                  GestureDetector(onTap: (){

                  }, child: Text("Forgot password", style: AppTextStyles.headline6.copyWith(color: AppColors.primaryColor)))
                ],),


              SizedBox(height: height * 0.04,),

              RoundButtonFiled(title: "Continue", onPress: () {
                if (_emailCont.text.isEmpty) {
                  Utils.flushBarMessage(message: "Please enter your email",
                      icon: Icons.error,
                      context: context);
                } else if (_passwordCont.text.isEmpty) {
                  Utils.flushBarMessage(message: "Please enter your Password",
                      icon: Icons.error,
                      context: context);
                } else if (_passwordCont.text.length <= 2) {
                  Utils.flushBarMessage(
                      message: "Please enter 6 digit password",
                      icon: Icons.error,
                      context: context);
                }
                if (_emailCont.text.isNotEmpty &&
                    _passwordCont.text.isNotEmpty &&
                    _passwordCont.text.length <= 2) {
                  if (_emailCont.value.text == tenantEmail &&
                      _passwordCont.value.text == tenantPD) {
                    Navigator.pushNamed(
                        context, AppRouteName.tenantHomeScreen);
                  } else if (_emailCont.value.text == adminEmail &&
                      _passwordCont.value.text == adminPD) {
                    Navigator.pushNamed(
                        context, AppRouteName.adminHomeScreen);
                  } else {
                    Utils.flushBarMessage(
                        message: "pls enter correct Id and password",
                        context: context);
                  }
                }
              },),


              SizedBox(height: height * 0.02,),

              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 const Text("Don't have an account? ",style: AppTextStyles.bodyText2,),

                  GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, AppRouteName.signUpScreen2);
                      },
                      child: Text("Sign up",style: AppTextStyles.bodyText1.copyWith(fontSize: 16,color: AppColors.primaryColor),))
                ],
              )
            ],

          ),
        )
    );
  }
}
