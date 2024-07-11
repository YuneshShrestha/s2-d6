import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key, required this.addToList});
  final Function addToList;
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Form Page",
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: Colors.blue,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text field
              _createAdaptiveTextField(),
              // Text field
              // Title
              const Text("Title"),
              TextFormField(
                controller: titleController,
                validator: (value) {
                  if (value == null) {
                    return "Title Must Not Be null";
                  }
                  if (value.isEmpty) {
                    return "Title Must Be Provided";
                  }
                },
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              // Description
              const Text("Description"),
              TextFormField(
                controller: descController,
                maxLines: 3,
                validator: (value) {
                  if (value == null) {
                    return "Description Must Not Be null";
                  }
                  if (value.isEmpty) {
                    return "Description Must Be Provided";
                  }
                },
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),

              // Button
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    // ! guarantees that currentState won't be null
                    var errorsCount =
                        formKey.currentState!.validateGranularly().length;
                    if (formKey.currentState!.validate()) {
                      addToList(titleController.text, descController.text);
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Errors $errorsCount"),
                        ),
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

  Widget _createAdaptiveTextField() {
    final _border = OutlineInputBorder(
      borderSide: BorderSide(color: CupertinoColors.lightBackgroundGray),
    );

    final iOSDecoration = InputDecoration(
      border: _border,
      enabledBorder: _border,
      focusedBorder: _border,
      filled: true,
      fillColor: CupertinoColors.white,
      hoverColor: CupertinoColors.white,
      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
    );

    return !Platform.isIOS
        ? SizedBox(
            height: 36.0,
            child: TextField(
              decoration: iOSDecoration,
            ),
          )
        : TextField();
  }
}
