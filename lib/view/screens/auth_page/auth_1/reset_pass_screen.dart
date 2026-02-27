import 'package:manage_hotel/utils/app_export.dart';

class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({super.key});

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  final TextEditingController _emailCont = TextEditingController();
  final TextEditingController _passwordCont = TextEditingController();
  final TextEditingController _confirmPasswordCont = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();
  FocusNode confirmPassFocusNode = FocusNode();

  ValueNotifier<bool> obSecurePassword = ValueNotifier<bool>(true);

  String token = "";
  // Future<dynamic> loginPost() async {
  //   final url = Uri.parse(
  //       "https://cs-chcff8hfbahvdyd9.southindia-01.azurewebsites.net/api/Account/GetUsers");
  //   try {
  //     final response =
  //         await http.get(url, headers: {'Content-Type': 'application/json'});
  //
  //     dynamic data = jsonDecode(response.body);
  //     print("data yah dikhega");
  //     print(data.toString());
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {

    late Size mq = MediaQuery.of(context).size;
    return Material(
      child: SizedBox(
        height: mq.height,
        width: mq.width,
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.4,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(color: Colors.white),
                ),
                Container(
                  height: mq.height / 4,
                  width: mq.width,
                  decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(50))),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                      Text(
                        "Reset Password",
                        style: myTextStyle20(
                            textColor: Colors.white,
                            textFontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: mq.width,
                height: mq.height / 1.333,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    mq.width * 0.05, mq.height * 0.05, mq.width * 0.05, 0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.332,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(50))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //  Text("We've ent an SMS with an activation\ncode to your phone (+91 0000000000)",style: myTextStyle15(textColor: Colors.black26,textFontWeight: FontWeight.w600),),

                      SizedBox(
                        height: 80,
                      ),

                      TextFormField(
                        controller: _emailCont,
                        decoration: InputDecoration(labelText: "Email"),
                        focusNode: emailFocusNode,
                        onFieldSubmitted: (v) {
                          Utils.fieldFocusChange(
                              context, emailFocusNode, passFocusNode);
                        },
                      ),

                      SizedBox(
                        height: 40,
                      ),

                      ValueListenableBuilder(
                          valueListenable: obSecurePassword,
                          builder: (context, value, child) {
                            return TextFormField(
                              controller: _passwordCont,
                              focusNode: passFocusNode,
                              obscureText: obSecurePassword.value,
                              onFieldSubmitted: (v) {
                                Utils.fieldFocusChange(context, passFocusNode,
                                    confirmPassFocusNode);
                              },
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  suffixIcon: InkWell(
                                      onTap: () {
                                        obSecurePassword.value =
                                            !obSecurePassword.value;
                                      },
                                      child: Icon(obSecurePassword.value
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined))),
                            );
                          }),

                      SizedBox(
                        height: mq.height / 180,
                      ),
                      Text("Must be at least 8 characters"),

                      SizedBox(height: 40),

                      ValueListenableBuilder(
                          valueListenable: obSecurePassword,
                          builder: (context, value, child) {
                            return TextFormField(
                              controller: _confirmPasswordCont,
                              focusNode: confirmPassFocusNode,
                              obscureText: obSecurePassword.value,
                              decoration: InputDecoration(
                                  labelText: "Conform Password",
                                  suffixIcon: InkWell(
                                      onTap: () {
                                        obSecurePassword.value =
                                            !obSecurePassword.value;
                                      },
                                      child: Icon(obSecurePassword.value
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined))),
                            );
                          }),

                      SizedBox(
                        height: mq.height / 180,
                      ),
                      Text("Must be at least 8 characters"),

                      SizedBox(
                        height: 40,
                      ),

                      SizedBox(
                        height: 40,
                      ),
                      RoundButtonFiled(
                        title: "Verify email",
                        onPress: () {
                          Map data = {
                            "token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ0cml2ZW5kcmEga3VtYXIiLCJqdGkiOiJiZTAwOWY3Mi01NTljLTQ0MmYtYTNmYy04ZTE5MDk2MzliMTMiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJ0cml2ZW5kcmFzYWh1MDIyQGdtYWlsLmNvbSIsImV4cCI6MTcyNzU0NjMyNywiaXNzIjoiaHR0cHM6Ly9jcy1jaGNmZjhoZmJhaHZkeWQ5LnNvdXRoaW5kaWEtMDEuYXp1cmV3ZWJzaXRlcy5uZXQvIiwiYXVkIjoiaHR0cHM6Ly9jcy1jaGNmZjhoZmJhaHZkeWQ5LnNvdXRoaW5kaWEtMDEuYXp1cmV3ZWJzaXRlcy5uZXQvIn0.YO9n5e2gwx6KknvSgH5O01JzzdGOfBxy72uSfo5HeQw",
                            "email" : _emailCont.text,
                            "newPassword" : _passwordCont.text,
                            "confirmedPassword" : _confirmPasswordCont.text
                          };

                        },
                      ),
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
