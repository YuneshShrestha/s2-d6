import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todolist/screens/home_page.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key, required this.function});
  final Function function;

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return HomeScreen(
          function: widget.function,
        );
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text(
        "Loader Screen",
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
    var needHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 400) {
            // Column
            return Column(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    // height: needHeight / 2,
                    color: Colors.red,
                    child: Image.asset(
                      "assets/todolist.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    // height: needHeight / 2,
                    child: const Text(
                      "TODO List App",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    // height: needHeight / 2,
                    color: Colors.red,
                    child: Image.asset(
                      "assets/todolist.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    // height: needHeight / 2,
                    child: const Text(
                      "TODO List App",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
