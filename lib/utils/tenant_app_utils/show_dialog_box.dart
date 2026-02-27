import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:manage_hotel/utils/app_export.dart';
import 'package:manage_hotel/view/widgets/input_text_field.dart';

void addFloor$RoomDialog(context, VoidCallback onTab,TextEditingController? controller,int? task) async {
  showDialog(
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: AlertDialog(
            title: task==1? const Text("Add Floor",style: AppTextStyles.headline5,) : const Text("Add Room",style: AppTextStyles.headline5,),
            content: InputTextField(
              hint: task==1 ?  "Enter Floor Name" :  "Enter Room Name",
              controller: controller,
              onValidator: (value){},
              onFiledSubmittedValue: (newValue) {  },
            ),
            actions: [
              TextButton(

                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel",style: TextStyle(color: AppColors.primaryColor),)),
              ElevatedButton(
                onPressed: onTab,
                style:
                    ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                child: const  Text("Save",style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        );
      });
}

void add$UpdateUserDialog(context,VoidCallback onTab,int? task,TextEditingController? controller,FocusNode? focusNode,FocusNode? current, FocusNode? nextFocus) {
  showDialog(
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: AlertDialog(
            title: task==1? const Text("Add User") : const Text("Update User"),
            content: Container(
              width: 350,
              height: 220,
              child: Column(
                children: [

                 // reTextField(context, controller, focusNode, FocusNode, current, current),

                  TextField(
                    decoration: InputDecoration(hintText: "Enter Email"),
                  ),

                  TextField(
                    decoration: InputDecoration(hintText: "Enter Phone"),
                  ),

                  TextField(
                    decoration: InputDecoration(hintText: "Enter Country"),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              OutlinedButton(onPressed: onTab, child: Text("save"))
            ],
          ),
        );
      });
}

Widget reTextField(context,TextEditingController? controller,FocusNode focusNode,FocusNode, FocusNode current, FocusNode nextFocus){
 return InputTextField(
      controller: controller,
      focusNode: focusNode,
      keyBordType: TextInputType.emailAddress,
      prefixIcon: Icons.email_outlined,
      onFiledSubmittedValue: (value) {
        Utils.fieldFocusChange(
            context, current, nextFocus);
      },
      onValidator: (value) {
        return value.isEmpty ? 'Enter Email' : null;
      },
      label: "Email");
}

void showAddSmartDevices(context) {
  showDialog(
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: AlertDialog(
            title: Text("Add devices"),
            content: TextField(
              decoration: InputDecoration(hintText: "Enter devices Name"),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              TextButton(onPressed: () {}, child: const Text("Save")),
            ],
          ),
        );
      });
}
