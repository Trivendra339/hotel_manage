
import 'package:flutter/material.dart';
import 'package:manage_hotel/utils/tenant_app_utils/appbar/popupMenu_button.dart';

class Custom_Appbar extends StatelessWidget {

 final AnimationController animationController;
 final Animation colorsTween2,hotelTween,iconTween; // this late add (colorsTween)
 final Function()? addIconButton;
 final Function()? drawerIconButton;
 final Function()? PopupIconButton;

 final BoardType? currentBoardType;
 final OnNewBoardTypeSelected? onNewBoardTypeSelected;

   Custom_Appbar({super.key,
    required this.animationController,
  // required this.colorsTween,
  required this.colorsTween2,
  required this.hotelTween,
  required this.iconTween,
  required this.addIconButton,
  required this.drawerIconButton,
  required this.PopupIconButton,

  this.currentBoardType,
  this.onNewBoardTypeSelected
});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   colors: [colorsTween.value, Colors.white.withOpacity(0)],
              //   // Set your gradient colors here
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   stops: const [0.0, 0.0],
              // ),
            ),
            child: AppBar(
              backgroundColor: colorsTween2.value,
              // Make AppBar background transparent
              elevation: 0,
              title: InkWell(
                  onTap: PopupIconButton,
                  child: BoardTypeMenu(
                 //   hotelTween: hotelTween,
                 //   iconTween: iconTween,
                  )
              ),

              leading: Icon(
                Icons.qr_code,
                color: iconTween.value,
              ),
              actions: [
                IconButton(onPressed: addIconButton,
                    icon: (Icon(Icons.add, color: iconTween.value,))),


                IconButton(onPressed: (){Scaffold.of(context).openEndDrawer();}, icon: (Icon(Icons.dehaze, color: iconTween.value,))),
              ],
            ),
          );
        },
      ),
    );
  }


}