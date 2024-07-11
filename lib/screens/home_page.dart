import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/form_page.dart';
import 'package:todolist/widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.function});
  final Function function;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var dataList = [
    {
      "id": "1",
      "title": "Title1",
      "description": "Description",
    },
    {
      "id": "2",
      "title": "Title2",
      "description": "Description",
    },
    {
      "id": "3",
      "title": "Title1",
      "description": "Description",
    },
  ];
  bool isTrue = false;
  void addToDataList(String data, String desc) {
    setState(() {
      dataList.add({
        "id": DateTime.now().toString(),
        "title": data,
        "description": desc,
      });
    });
  }

  void removeFromDataList(String id) {
    setState(() {
      dataList.removeWhere((e) {
        return e['id'] == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todo App",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return FormPage(
                  addToList: addToDataList,
                );
              }));
            },
            icon: const Icon(Icons.add),
          ),
          Switch.adaptive(
              value: isTrue,
              onChanged: (val) {
                widget.function();
                setState(() {
                  isTrue = val;
                });
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...dataList.map((e) {
              return TaskCard(
                // ValueKey GlobalKey
                key: ValueKey(e["id"]),
                description: e["description"] ?? "No Title Found",
                title: e["title"] ?? "No Title Found",
                deleteData: () {
                  removeFromDataList(e["id"] ?? "");
                },
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}


  // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     // Text
            //     Text("Title"),

            //     // Icon
            //     Icon(Icons.delete)
            //   ],
            // ),
