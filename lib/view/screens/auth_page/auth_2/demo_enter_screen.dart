import 'package:manage_hotel/utils/app_export.dart';

class EnterCode2 extends StatelessWidget {
  const EnterCode2({super.key});

  @override
  Widget build(BuildContext context) {
    late Size mq = MediaQuery.of(context).size * 1;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: mq.width*0.05,horizontal: mq.width*0.06),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter code",style: myTextStyle30(textColor: Colors.black87,textFontWeight: FontWeight.w600),),
            Text("We've ent an SMS with an activation\ncode to your phone (+91 0000000000)",style: myTextStyle15(textColor: Colors.black26,textFontWeight: FontWeight.w600),),

            const SizedBox(height: 80,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(height: 35,width: 35,color: Colors.grey,),
                Container(height: 35,width: 35,color: Colors.grey,),
                Container(height: 35,width: 35,color: Colors.grey,),
                Container(height: 35,width: 35,color: Colors.grey,),
              ],
            ),

            const SizedBox(height: 40,),
            RoundButtonFiled(title: "Verify email",onPress: (){

            },),

          ],
        ),
      ),
    );
  }


}
