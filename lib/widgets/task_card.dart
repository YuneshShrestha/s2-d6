import 'dart:math';

import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  const TaskCard(
      {super.key,
      required this.title,
      required this.deleteFunction,
      required this.id});
  final String title;
  final String id;
  final Function deleteFunction;

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
    return Container(
  
      margin: const EdgeInsets.all(2),
      height: 60,
      color: color,
      child: ListTile(
        
        title: Text(widget.title),
        trailing: IconButton(
            onPressed: () {
              widget.deleteFunction(widget.id);
            },
            icon: const Icon(Icons.delete)),
      ),
    );
  }
}
