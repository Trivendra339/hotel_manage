import 'package:manage_hotel/utils/app_export.dart';
import 'package:manage_hotel/view/widgets/input_text_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailCont = TextEditingController();
  final TextEditingController _passwordCont = TextEditingController();

  // final _rememberMe = true;

  var tenantEmail = "t";
  var tenantPD = "22";

  var adminEmail = "a";
  var adminPD = "11";

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  var j = TenantAuthRepository();

  @override
  void dispose() {
    super.dispose();
    _emailCont.dispose();
    _passwordCont.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late Size mq = MediaQuery.of(context).size * 1;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [AppColors.primaryColor, AppColors.secondaryColor])),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              height: mq.height * 0.30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: 200,
                  //   width: double.infinity,
                  //   child: Image.asset(
                  //       color: Colors.white,
                  //       "assets/images/user_login_or_authenticate.png"),
                  // ),

                  Text(
                    "Login",
                    style: AppTextStyles.headline3
                        .copyWith(color: AppColors.homeBackgroundColor),
                  ),
                  Text(
                    "Welcome back! Please enter your details !!",
                    style: myTextStyle15(
                        textColor: Colors.white,
                        textFontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 50, 15, 0),
                decoration: const BoxDecoration(
                    color: AppColors.homeBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Email Widget :-

                      InputTextField(
                          controller: _emailCont,
                          focusNode: emailFocusNode,
                          keyBordType: TextInputType.emailAddress,
                          prefixIcon: Icons.email_outlined,
                          onFiledSubmittedValue: (value) {
                            Utils.fieldFocusChange(
                                context, emailFocusNode, passwordFocusNode);
                          },
                          onValidator: (value) {
                            return value.isEmpty ? 'Enter Email' : null;
                          },
                          label: "Email"),

                      SizedBox(
                        height: mq.height * 0.02,
                      ),

                      InputTextField(
                          controller: _passwordCont,
                          focusNode: passwordFocusNode,
                          keyBordType: TextInputType.visiblePassword,
                          prefixIcon: Icons.lock_open_outlined,
                          suffixIcon: Icons.visibility_outlined,
                          onFiledSubmittedValue: (value) {},
                          onValidator: (value) {
                            return value.isEmpty ? 'Enter Email' : null;
                          },
                          label: "Password"),

                      SizedBox(
                        height: mq.height * 0.02,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Remember ",
                              style: AppTextStyles.bodyText2),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRouteName.forgetPassScreen);
                              },
                              child: Text("Forgot password",
                                  style: AppTextStyles.headline6.copyWith(
                                      color: AppColors.primaryColor,
                                      fontSize: 15)))
                        ],
                      ),

                      SizedBox(
                        height: mq.height / 20,
                      ),

                      RoundButtonFiled(
                        title: "Login",
                        onPress: () {
                          if (_emailCont.text.isEmpty) {
                            Utils.flushBarMessage(
                                message: "Please enter your email",
                                icon: Icons.error,
                                context: context);
                          } else if (_passwordCont.text.isEmpty) {
                            Utils.flushBarMessage(
                                message: "Please enter your Password",
                                icon: Icons.error,
                                context: context);
                          } else if (_passwordCont.text.length == 2) {
                            Utils.flushBarMessage(
                                message: "Please enter 6 digit password",
                                icon: Icons.error,
                                context: context);
                          } else {
                            // Map data = {
                            //   "userEmail": _emailCont.text.toString(),
                            //   "password": _passwordCont.text.toString(),
                            //   "rememberMe": false
                            // };
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
                        },
                      ),

                      SizedBox(height: mq.height * 0.02),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: AppTextStyles.bodyText2,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRouteName.signUpScreen);
                              },
                              child: Text(
                                "Sign up",
                                style: AppTextStyles.bodyText1.copyWith(
                                    fontSize: 16, color: Color(0xFF2596be)),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
