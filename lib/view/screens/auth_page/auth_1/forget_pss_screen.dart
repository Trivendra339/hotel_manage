import 'package:manage_hotel/utils/app_export.dart';
import 'package:manage_hotel/view/widgets/input_text_field.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {

  final TextEditingController _emailCont = TextEditingController();
  FocusNode emailFocusNode = FocusNode();


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
                  decoration: const BoxDecoration(
                      color: Colors.white
                  ),
                ),
                Container(
                  height: mq.height / 4,
                  width: mq.width,
                  decoration: const BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(50))
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 40,width: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                        ),
                        child: TextButton(
                          onPressed: (){Navigator.pop(context);},
                          child: Icon(Icons.arrow_back),
                        ),
                      ),

                      Text("Forget Password",style: myTextStyle20(textColor: Colors.white,textFontWeight: FontWeight.bold),)
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
                  color: AppColors.secondaryColor,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding:  EdgeInsets.fromLTRB(mq.width * 0.05, mq.height * 0.05, mq.width * 0.05, 0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.332,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
                ),
                child: SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    //  Text("We've ent an SMS with an activation\ncode to your phone (+91 0000000000)",style: myTextStyle15(textColor: Colors.black26,textFontWeight: FontWeight.w600),),

                      SizedBox(height: 80,),

                      InputTextField(controller: _emailCont,
                          focusNode: emailFocusNode,
                          keyBordType: TextInputType.emailAddress,
                          prefixIcon: Icons.email_outlined,
                          onFiledSubmittedValue: (value){
                          },
                          onValidator: (value){
                            return value.isEmpty ? 'Enter Email' : null ;
                          },
                          label: "Email"),

                      SizedBox(height: 40,),
                      RoundButtonFiled(title: "Verify email", onPress: () {  },),

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
