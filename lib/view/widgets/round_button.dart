import 'package:flutter/material.dart';
import 'package:manage_hotel/view/theme/app_colors.dart';

class RoundButtonFiled extends StatelessWidget {
  final String title;
  final bool loading;
  final IconData? iconData;
  final TextStyle? textStyle;
  final VoidCallback onPress;

  const RoundButtonFiled(
      {super.key,
      required this.title,
      required this.onPress,
      this.iconData,
      this.textStyle,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.width * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return InkWell(
      onTap: loading? null : onPress,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 0.1),
        alignment: Alignment.center,
          height: height * 0.11,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  AppColors.primaryColor,
                  AppColors.secondaryColor
                ]
              )
          ),
          child: loading == false ? iconData == null ? Text(title, style: const TextStyle(
              color: AppColors.whiteColor,
              fontSize: 18,
              fontWeight: FontWeight.w500),) : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                width: 20,
                child: Icon(iconData,color: Colors.white,),
              ),

              const SizedBox(
                width: 20,
              ),


              Text(
                title,
                style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              )
            ],
          ) : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),

              const  SizedBox(
                width: 20,
              ),


              Text(
                title,
                style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              )
            ],
          )
      ),
    );
  }

}



class MyRoundButtonOutLine extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  final IconData? iconData;

  const MyRoundButtonOutLine(
      {super.key,
      required this.title,
      required this.onPress,
      this.loading = false,
      this.iconData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.8,
      width: double.infinity,
      child: OutlinedButton(
        style: ButtonStyle(
          side: WidgetStateProperty.all<BorderSide>(const BorderSide(
              color: AppColors.primaryColor,
              width: 2.5,
              style: BorderStyle.solid)),
        ),
        onPressed: onPress,
        child: (iconData != null)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(iconData),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        color: AppColors.primaryTextTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )
            : Text(
                title,
                style: const TextStyle(
                    color: AppColors.primaryTextTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
      ),
    );
  }
}
