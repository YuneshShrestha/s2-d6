import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key, required this.title, required this.desc});
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Text(desc),
    );
  }
}
