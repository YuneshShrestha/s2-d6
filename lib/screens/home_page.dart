import 'package:flutter/material.dart';
import 'package:todolist/screens/form_page.dart';
import 'package:todolist/widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
        title: const Text("Todo App"),
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
