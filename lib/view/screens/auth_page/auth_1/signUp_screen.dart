import 'package:manage_hotel/utils/app_export.dart';
import 'package:manage_hotel/view/widgets/input_text_field.dart';

class SignUp_Screen extends StatefulWidget {
  const SignUp_Screen({super.key});

  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {
  final TextEditingController _nameCont = TextEditingController();
  final TextEditingController _emailCont = TextEditingController();
  final TextEditingController _phoneCont = TextEditingController();
  final TextEditingController _passwordCont = TextEditingController();
  final TextEditingController _confirmPasswordCont = TextEditingController();

  FocusNode _nameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _phoneNumberFocusNode = FocusNode();
  FocusNode _passFocusNode = FocusNode();
  FocusNode _conformPassFocusNode = FocusNode();

  @override
  void dispose() {
    _nameCont.dispose();
    _emailCont.dispose();
    _phoneCont.dispose();
    _passwordCont.dispose();
    _confirmPasswordCont.dispose();

    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _passFocusNode.dispose();
    _conformPassFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late Size mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [AppColors.primaryColor, AppColors.secondaryColor])),
        child: Column(
          children: [
            Container(
                height: mq.height * 0.15,
                child: Row(
                  children: [
                    BackButton(
                      color: AppColors.whiteColor,
                    ),
                    Text(
                      "Back",
                      style: AppTextStyles.headline6
                          .copyWith(color: AppColors.whiteColor),
                    )
                  ],
                )),
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
                          controller: _nameCont,
                          focusNode: _nameFocusNode,
                          keyBordType: TextInputType.emailAddress,
                          prefixIcon: Icons.person_outline_rounded,
                          onFiledSubmittedValue: (value) {
                            Utils.fieldFocusChange(
                                context, _nameFocusNode, _emailFocusNode);
                          },
                          onValidator: (value) {
                            return value.isEmpty ? 'Enter Name' : null;
                          },
                          label: "Enter your name"),

                      SizedBox(
                        height: mq.height * 0.02,
                      ),

                      InputTextField(
                          controller: _emailCont,
                          focusNode: _emailFocusNode,
                          keyBordType: TextInputType.emailAddress,
                          prefixIcon: Icons.email_outlined,
                          onFiledSubmittedValue: (value) {
                            Utils.fieldFocusChange(context, _emailFocusNode,
                                _phoneNumberFocusNode);
                          },
                          onValidator: (value) {
                            return value.isEmpty ? 'Enter Email' : null;
                          },
                          label: "Enter your email"),

                      SizedBox(
                        height: mq.height * 0.02,
                      ),

                      InputTextField(
                          controller: _phoneCont,
                          focusNode: _phoneNumberFocusNode,
                          keyBordType: TextInputType.emailAddress,
                          prefixIcon: Icons.phone,
                          onFiledSubmittedValue: (value) {
                            Utils.fieldFocusChange(
                                context, _phoneNumberFocusNode, _passFocusNode);
                          },
                          onValidator: (value) {
                            return value.isEmpty ? 'Enter Phone' : null;
                          },
                          label: "Enter your phone"),

                      SizedBox(
                        height: mq.height * 0.02,
                      ),

                      InputTextField(
                          controller: _passwordCont,
                          focusNode: _passFocusNode,
                          keyBordType: TextInputType.emailAddress,
                          prefixIcon: Icons.lock_open_outlined,
                          suffixIcon: Icons.visibility_outlined,
                          onFiledSubmittedValue: (value) {
                            Utils.fieldFocusChange(
                                context, _passFocusNode, _conformPassFocusNode);
                          },
                          onValidator: (value) {
                            return value.isEmpty ? 'Enter password' : null;
                          },
                          label: "Enter your password"),

                      SizedBox(
                        height: mq.height * 0.02,
                      ),

                      // Password Widget :-
                      InputTextField(
                          controller: _confirmPasswordCont,
                          focusNode: _conformPassFocusNode,
                          keyBordType: TextInputType.visiblePassword,
                          prefixIcon: Icons.lock_open_outlined,
                          suffixIcon: Icons.visibility_outlined,
                          onFiledSubmittedValue: (value) {},
                          onValidator: (value) {
                            return value.isEmpty ? 'Enter conform' : null;
                          },
                          label: "Enter your conform"),

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
                        title: "Sign up",
                        onPress: () {},
                      ),

                      SizedBox(height: mq.height / 50),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "have an account? ",
                            style: AppTextStyles.bodyText2,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRouteName.loginScreen);
                              },
                              child: Text(
                                "Login",
                                style: AppTextStyles.bodyText1.copyWith(
                                    fontSize: 16,
                                    color: AppColors.primaryColor),
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
