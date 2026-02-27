import 'package:flutter/cupertino.dart';
import 'package:manage_hotel/utils/app_export.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FormFieldSetter onFiledSubmittedValue;
  final FormFieldValidator onValidator;
  final TextInputType? keyBordType;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final String? label,hint;
  final bool obscureText;
  final bool enable, autoFocus;
  final double contentPaddingVertical;

   InputTextField({
    super.key,
    required this.controller,
    this.focusNode,
    required this.onFiledSubmittedValue,
    required this.onValidator,
    this.keyBordType,
    this.suffixIcon,
    this.prefixIcon,
    this.label,
    this.hint,
    this.enable = true,
    this.autoFocus = false,
    this.obscureText = false,
    this.contentPaddingVertical = 0,
  });

  final ValueNotifier<bool> _obSecurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ValueListenableBuilder(
          valueListenable: _obSecurePassword,
          builder: (context, value, child) {
            return TextFormField(
              onTapOutside: (event){
                focusNode?.unfocus();
              },
              cursorColor: AppColors.primaryTextTextColor,
              controller: controller,
              obscureText: suffixIcon == null ? false : _obSecurePassword.value,
              focusNode: focusNode,
              onFieldSubmitted: onFiledSubmittedValue,
              validator: onValidator,
              keyboardType: keyBordType,
              enabled: enable,
              autofocus: autoFocus,
              style: AppTextStyles.bodyText2.copyWith(height: 0.9,fontSize: 19),
              decoration: InputDecoration(
                suffixIcon: suffixIcon == null? null : GestureDetector(
                    onTap: () {
                      _obSecurePassword.value =
                      !_obSecurePassword.value;
                    },
                    child: Icon(_obSecurePassword.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined)),
                prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
                contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: contentPaddingVertical),
                labelText: label,
                labelStyle: AppTextStyles.bodyText2.copyWith(height: 0,color: AppColors.primaryTextTextColor.withOpacity(0.8)),
                hintText: hint,
                hintStyle: AppTextStyles.bodyText2.copyWith(height: 0,color: AppColors.primaryTextTextColor.withOpacity(0.8)),

                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textFieldDefaultFocus),),

                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textFieldDefaultBorderColor),),

                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.secondaryColor),),

                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.alertColor),),
              ),
            );
          }),
    );
  }


}

/*
          border:  OutlineInputBorder(
              borderSide:  BorderSide(color: AppColors.textFieldDefaultFocus),
              borderRadius: BorderRadius.all(Radius.circular(8))),

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:  BorderSide(color: AppColors.secondaryColor)),

          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:  BorderSide(color: AppColors.alertColor)),

          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:  BorderSide(color: AppColors.textFieldDefaultBorderColor)),


  // This is TextFormField first code :-
              TextFormField(
        onTapOutside: (event){
          focusNode?.unfocus();
        },
        cursorColor: AppColors.primaryTextTextColor,
        controller: controller,
        obscureText: _obSecurePassword.value,
        focusNode: focusNode,
        onFieldSubmitted: onFiledSubmittedValue,
        validator: onValidator,
        keyboardType: keyBordType,
        enabled: enable,
        autofocus: autoFocus,
        style: AppTextStyles.bodyText2.copyWith(height: 0.9,fontSize: 19),
        decoration: InputDecoration(
          suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
          prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
          contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: contentPaddingVertical),
          labelText: label,
          labelStyle: AppTextStyles.bodyText2.copyWith(height: 0,color: AppColors.primaryTextTextColor.withOpacity(0.8)),
          hintText: hint,
          hintStyle: AppTextStyles.bodyText2.copyWith(height: 0,color: AppColors.primaryTextTextColor.withOpacity(0.8)),

          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.textFieldDefaultFocus),),

          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.textFieldDefaultBorderColor),),

          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondaryColor),),

          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.alertColor),),
        ),
      )



 */