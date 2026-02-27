import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Assuming there are 10 tasks to show
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Task ${index + 1}'), // Display task title
          subtitle: Text('Task description goes here'), // Display task description
          leading: Icon(Icons.check_circle_outline), // Optional icon
          trailing: Icon(Icons.arrow_forward), // Optional trailing icon
        );
      },
    );
  }

}
