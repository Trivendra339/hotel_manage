import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_hotel/view/theme/app_colors.dart';

import '../../../popup.dart';


 enum BoardType {list, board}
typedef OnNewBoardTypeSelected = Function();

class BoardTypeMenu extends StatelessWidget {

  // final Animation? hotelTween,iconTween;

   const BoardTypeMenu({super.key,
   // this.hotelTween,
   //  this.iconTween,
     this.currentBoardType,
     this.onNewBoardTypeSelected
  });
  final BoardType? currentBoardType;
  final OnNewBoardTypeSelected? onNewBoardTypeSelected;

  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = Get.put(DataProvider());

    return FutureBuilder(
      future: Future.value(dataProvider.items), // Assuming items are pre-fetched
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();  // Show a loading indicator until data is ready
        }

        return PopupMenuButton<String>(

          color: Colors.grey[100],
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height / 6,
          ),
          position: PopupMenuPosition.under,
          offset: const Offset(0, 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),

          onSelected: (String selectedItem) {
            print('Selected: $selectedItem');
          },
          itemBuilder: (context) {
            // Dynamic string data loaded from API
            return snapshot.data!.map<PopupMenuEntry<String>>((String item) {
              return _BoardTypePopupMenuItem(item);
            }).toList();
          },

          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "My Hotel",
                style: TextStyle(
                 // color: hotelTween?.value,
                  color: AppColors.homeBackgroundColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 4),
              Icon(Icons.arrow_drop_down,
                  //color: iconTween?.value),
                color: AppColors.homeBackgroundColor,
              )],
          ),
        );
      },
    );


    /* if (dataProvider.items.isEmpty) {
    return CircularProgressIndicator();  // Ya koi loading widget
  }

    return  PopupMenuButton<String>(
      onSelected: (String selectedItem) {
        // Jab koi item select ho tab yeh function chalega
        print('Selected: $selectedItem');
      },
      itemBuilder: (context) {
        // API se laaya hua dynamic string data yahan load hota hai

         return dataProvider.items.map((String item) {
           return _BoardTypePopupMenuItem(item);
         }).toList();
      },

      color: Colors.grey[100],
      constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
              maxHeight: MediaQuery.of(context).size.height / 3.4,
      ),
      position: PopupMenuPosition.under,
      offset: Offset(0, 12),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24)
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("My Hotel",
          style: TextStyle(
            color: widget.hotelTween?.value,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(width: 4,),
          Icon(Icons.arrow_drop_down, color: widget.iconTween?.value),
        ],
      ),
    ); */
  }


}

const double kBoardTypePopupMenuItemHeight = 65;

class _BoardTypePopupMenuItem extends PopupMenuEntry<String>{
  final String value;


  const _BoardTypePopupMenuItem(this.value);

  @override
  double get height => kBoardTypePopupMenuItemHeight;

  @override
  bool represents(String? v) {
    return value == v;
  }

  @override
  State<StatefulWidget> createState() {
    return _BoardTypePopupMenuItemState();
  }
}

class _BoardTypePopupMenuItemState extends State<_BoardTypePopupMenuItem> {
  @override
  Widget build(BuildContext context){
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width * 0.8,  // Control the width as needed
        minHeight: kBoardTypePopupMenuItemHeight,  // Ensure the item respects the height
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(widget.value, style: const TextStyle(fontSize: 16,color: Colors.black)),
        ),
      ),
    );
  }
}
