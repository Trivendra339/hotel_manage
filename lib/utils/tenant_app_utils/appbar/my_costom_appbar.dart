
import 'package:flutter/material.dart';
import 'package:manage_hotel/utils/tenant_app_utils/appbar/popupMenu_button.dart';

Widget MyCustomAppbar({
  context,VoidCallback? addIconButton,
  VoidCallback? drawerIconButton,
  VoidCallback? PopupIconButton
}) {
 // late Size mq = MediaQuery.of(context).size;
  return AppBar(
    // Make AppBar background transparent
    title: InkWell(
        onTap: PopupIconButton,
        child: BoardTypeMenu(
        )
    ),

    leading: Icon(
      Icons.qr_code,
      color: Colors.white,
    ),
    actions: [
      IconButton(onPressed: addIconButton,
          icon: (Icon(Icons.add, color: Colors.white,))),


      IconButton(onPressed: (){Scaffold.of(context).openEndDrawer();}, icon: (Icon(Icons.dehaze, color: Colors.white,))),
    ],

  );
}