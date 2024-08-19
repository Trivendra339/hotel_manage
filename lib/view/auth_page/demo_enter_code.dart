import 'package:flutter/material.dart';
import 'package:hotel_manage/res/components/text_style.dart';

class Enter_Code2 extends StatelessWidget {
  const Enter_Code2({super.key});

  @override
  Widget build(BuildContext context) {

    late Size mq = MediaQuery.of(context).size * 1;
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: mq.width*0.2,horizontal: mq.width*0.06),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter code",style: myTextStyle30(textColor: Colors.black87,textFontWeight: FontWeight.w600),),
            Text("We've ent an SMS with an activation\ncode to your phone (+91 0000000000)",style: myTextStyle15(textColor: Colors.black26,textFontWeight: FontWeight.w600),),

          ],
        ),
      ),
    );
  }
}
