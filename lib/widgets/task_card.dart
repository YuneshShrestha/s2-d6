import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todolist/screens/task_page.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.title,
    required this.description,
    required this.deleteData,
    required this.addToImpList,
  });
  final String title;
  final String description;
  final Function deleteData;
  final Function addToImpList;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  late Color color;
  List<Color> colorsList = [
    Colors.black54,
    Colors.yellow,
    Colors.pinkAccent,
    Colors.orangeAccent
  ];
  @override
  void initState() {
    // Random Index
    // 0 - 2
    var randomIndex = Random().nextInt(colorsList.length);
    color = colorsList[randomIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return TaskPage(title: widget.title, desc: widget.description);
        }));
      },
      child: Container(
        margin: const EdgeInsets.all(2),
        height: 60,
        color: color,
        child: ListTile(
          title: Text(widget.title),
          subtitle: Text(widget.description),
          trailing: SizedBox(
            width: 100,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    widget.addToImpList();
                  },
                  icon: const Icon(Icons.star),
                ),
                IconButton(
                  onPressed: () {
                    widget.deleteData();
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
