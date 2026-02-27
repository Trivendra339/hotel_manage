import 'package:flutter/material.dart';
import 'package:manage_hotel/utils/app_export.dart';
import 'package:manage_hotel/view/theme/fonts.dart';

class AppTextStyles {
  static const TextStyle headline1 = TextStyle(fontSize: 40,fontFamily: AppFonts.sfProDisplayMedium,color: AppColors.primaryTextTextColor,fontWeight: FontWeight.w500,height: 1.6);
  static const TextStyle headline2 = TextStyle(fontSize: 32,fontFamily: AppFonts.sfProDisplayMedium,color: AppColors.primaryTextTextColor,fontWeight: FontWeight.w500,height: 1.6);
  static const TextStyle headline3 = TextStyle(fontSize: 28,fontFamily: AppFonts.sfProDisplayMedium,color: AppColors.primaryTextTextColor,fontWeight: FontWeight.w500,height: 1.9);
  static const TextStyle headline4 = TextStyle(fontSize: 24,fontFamily: AppFonts.sfProDisplayMedium,color: AppColors.primaryTextTextColor,fontWeight: FontWeight.w500,height: 1.6);
  static const TextStyle headline5 = TextStyle(fontSize: 20,fontFamily: AppFonts.sfProDisplayMedium,color: AppColors.primaryTextTextColor,fontWeight: FontWeight.w500,height: 1.6);
  static const TextStyle headline6 = TextStyle(fontSize: 17,fontFamily: AppFonts.sfProDisplayBold,color: AppColors.primaryTextTextColor,fontWeight: FontWeight.w700,height: 1.6);


  static const TextStyle bodyText1 = TextStyle(fontSize: 17,fontFamily: AppFonts.sfProDisplayBold,color: AppColors.primaryTextTextColor,fontWeight: FontWeight.w700,height: 1.6);
  static const TextStyle bodyText2 = TextStyle(fontSize: 14,fontFamily: AppFonts.sfProDisplayRegular,color: AppColors.primaryTextTextColor,height: 1.6);

  static const TextStyle caption = TextStyle(fontSize: 12,fontFamily: AppFonts.sfProDisplayBold,color: AppColors.primaryTextTextColor,height: 2.26);


}


TextStyle myTextStyle10(
    {Color textColor = Colors.white,
    FontWeight textFontWeight = FontWeight.normal}) {
  return TextStyle(fontSize: 11, color: textColor, fontWeight: textFontWeight);
}

TextStyle myTextStyle15(
    {Color textColor = Colors.white,
      TextDecoration? decoration,
    FontWeight textFontWeight = FontWeight.normal}) {
  return TextStyle(fontSize: 15, color: textColor, fontWeight: textFontWeight,decoration: decoration);
}

TextStyle myTextStyle18(
    {Color textColor = Colors.white,
    FontWeight textFontWeight = FontWeight.normal}) {
  return TextStyle(fontSize: 18, color: textColor, fontWeight: textFontWeight);
}

TextStyle myTextStyle20(
    {Color textColor = Colors.white,
    FontWeight textFontWeight = FontWeight.normal}) {
  return TextStyle(fontSize: 20, color: textColor, fontWeight: textFontWeight);
}

TextStyle myTextStyle25(
    {Color textColor = Colors.white,
    FontWeight textFontWeight = FontWeight.normal}) {
  return TextStyle(fontSize: 25, color: textColor, fontWeight: textFontWeight);
}

TextStyle myTextStyle30(
    {Color textColor = Colors.white,
    FontWeight textFontWeight = FontWeight.normal}) {
  return TextStyle(fontSize: 30, color: textColor, fontWeight: textFontWeight);
}

TextStyle myTextStyle35(
    {Color textColor = Colors.white,
    FontWeight textFontWeight = FontWeight.normal}) {
  return TextStyle(fontSize: 35, color: textColor, fontWeight: textFontWeight);
}
