import 'dart:ui';

import 'package:flutter/material.dart';

 void showAddFloorDialog(context) async {
    showDialog(
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: AlertDialog(
              title: Text("Add Floor"),
              content: TextField(
                decoration: InputDecoration(hintText: "Enter Floor Name"),
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
        }
    );
  }


void showAddRoomDialog(context) {
  showDialog(
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: AlertDialog(
            title: Text("Add Room"),
            content: TextField(
              decoration: InputDecoration(hintText: "Enter Room Name"),
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
