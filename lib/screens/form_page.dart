import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key, required this.addToList});
  final Function addToList;
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            // Text field
            TextField(
              controller: titleController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),

            // Button
            OutlinedButton(
              onPressed: () {
                addToList(titleController.text);
                Navigator.of(context).pop();
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
