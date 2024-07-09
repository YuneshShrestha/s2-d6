import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key, required this.addToList});
  final Function addToList;
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    GlobalKey<FormState> key = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text field
              const Text("Title: "),
              TextFormField(
                controller: titleController,
                validator: (data) {
                  if (data == null) {
                    return "Data Went Null.";
                  }
                  if (data.isEmpty) {
                    return "Please enter the text.";
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              // Description
              const Text("Description: "),
              TextFormField(
                controller: descriptionController,
                maxLines: 3,
                validator: (data) {
                  if (data == null) {
                    return "Data Went Null.";
                  }
                  if (data.isEmpty) {
                    return "Please enter the text.";
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              // Button
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    if (key.currentState != null &&
                        key.currentState!.validate()) {
                      addToList(titleController.text);
                      Navigator.of(context).pop();
                    } else {
                      final errorCount = key.currentState?.validateGranularly().length;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("$errorCount errors found."),),
                      );
                    }
                  },
                  child: const Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
