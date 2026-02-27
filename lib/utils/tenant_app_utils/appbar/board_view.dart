import 'package:flutter/material.dart';

class BoardView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildColumn("To Do", Colors.blue, ["Task 1", "Task 2"]),
          _buildColumn("In Progress", Colors.orange, ["Task 3"]),
          _buildColumn("Completed", Colors.green, ["Task 4"]),
        ],
      ),
    );
  }

  Widget _buildColumn(String title, Color color, List<String> tasks) {
    return Container(
      width: 200,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
            ),
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ...tasks.map((task) => ListTile(
            title: Text(task),
            leading: const Icon(Icons.check_box_outline_blank),
            trailing: const Icon(Icons.more_vert),
          )),
        ],
      ),
    );
  }
}
