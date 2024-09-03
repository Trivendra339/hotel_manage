import 'package:flutter/material.dart';
import 'app_colors.dart';

class MyRoundButtonFiled extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const MyRoundButtonFiled({super.key,required this.title,required this.onPress,this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onPress,
      child: Container(
        height: 40.8,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          color: MyAppColors.topBarColor
        ),
        child: Center(child: Text(title,style: TextStyle(color: MyAppColors.whiteColor,fontSize: 18,fontWeight: FontWeight.w500),)),
      ),
    );
  }
}

class MyRoundButtonOutLine extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  final IconData? iconData;

  const MyRoundButtonOutLine({super.key,required this.title,required this.onPress,this.loading = false,this.iconData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.8,
      width: double.infinity,
      child: OutlinedButton(
        style: ButtonStyle(
          side: WidgetStateProperty.all<BorderSide>(
            const BorderSide(color: MyAppColors.topBarColor,width: 2.5,style: BorderStyle.solid)
          ),
        ),
          onPressed: onPress, child: (iconData != null) ? Row( mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData),
          SizedBox(width: 5,),
          Text(title,style: const TextStyle(color: MyAppColors.blackColor,fontSize: 18,fontWeight: FontWeight.w500),),
        ],
      ) :  Text(title,style: const TextStyle(color: MyAppColors.blackColor,fontSize: 18,fontWeight: FontWeight.w500),),
      ),
    );
  }
}
