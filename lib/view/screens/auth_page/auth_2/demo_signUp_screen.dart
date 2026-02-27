import 'package:manage_hotel/utils/app_export.dart';
import 'package:manage_hotel/view/widgets/input_text_field.dart';

class SignUpScreen2 extends StatefulWidget {
  const SignUpScreen2({super.key});

  @override
  State<SignUpScreen2> createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SignUpScreen2> {

  ValueNotifier<bool> _obSecurePassword = ValueNotifier<bool>(true);

  final TextEditingController _nameCont = TextEditingController();
  final TextEditingController _emailCont = TextEditingController();
  final TextEditingController _phoneNumberCont = TextEditingController();
  final TextEditingController _passwordCont = TextEditingController();
  final TextEditingController _conformPasswordCont = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode phoneNumberFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode conformPasswordCont = FocusNode();

  @override
  Widget build(BuildContext context) {

    final  height = MediaQuery.of(context).size.height * 1;
    final  width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
        body: Container(alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Text("Sign up ✨", style: AppTextStyles.headline2),
                Text("Welcome back! Please enter your details !!",
                    style: AppTextStyles.bodyText2.copyWith(color: AppColors.secondaryTextColor)),

                SizedBox(height: height * 0.04,),

                InputTextField(controller: _nameCont,
                    focusNode: nameFocusNode,
                    onFiledSubmittedValue: (value){

                    },
                    onValidator: (value){
                      return value.isEmpty ? 'Enter Name' : null ;
                    },
                    label: "Enter your name"),

                InputTextField(controller: _emailCont,
                    focusNode: emailFocusNode,
                    onFiledSubmittedValue: (value){

                    },
                    onValidator: (value){
                      return value.isEmpty ? 'Enter Email' : null ;
                    },
                    label: "Enter your email"),

                InputTextField(controller: _phoneNumberCont,
                    focusNode: phoneNumberFocusNode,
                    onFiledSubmittedValue: (value){

                    },
                    onValidator: (value){
                      return value.isEmpty ? 'Enter phone number' : null ;
                    },
                    label: "Enter your phone number"),

                InputTextField(controller: _passwordCont,
                    focusNode: passwordFocusNode,
                    onFiledSubmittedValue: (value){

                    },
                    onValidator: (value){
                      return value.isEmpty ? 'Enter password' : null ;
                    },
                    label: "Enter your password"),

                InputTextField(controller: _conformPasswordCont,
                    focusNode: conformPasswordCont,
                    onFiledSubmittedValue: (value){

                    },
                    onValidator: (value){
                      return value.isEmpty ? 'Enter conform password' : null ;
                    },
                    label: "Enter your conform password"),


                SizedBox(height: height * 0.01,),



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

                    TextButton(onPressed: (){

                    }, child: Text("Forgot password", style: AppTextStyles.headline6.copyWith(color: AppColors.primaryColor)))
                  ],),


                SizedBox(height: height / 20,),

                RoundButtonFiled(title: "Sign up", onPress: () {
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

                },),


                SizedBox(height: height * 0.02,),

                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? ",style: AppTextStyles.bodyText2,),

                    GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, AppRouteName.loginScreen2);
                        },
                        child: Text("Sign in",style: AppTextStyles.bodyText1.copyWith(fontSize: 16,color: Color(0xFF2596be)),))
                  ],
                )
              ],

            ),
          ),
        )
    );
  }
}
