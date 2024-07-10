import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todolist/screens/home_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Timer(Duration(seconds: 5), () {
      // Navigate to the next screen after 5 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()), // Replace NextScreen with your actual next screen widget
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text("Welcome Screen"),
    );
    final actualScreenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        appBar.preferredSize.height;
    final actualWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar,
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 400) {
          return Column(
            children: [
              Container(
                height: actualScreenHeight / 2,
                child: Image.asset(
                  "assets/todolist.png",
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                height: actualScreenHeight / 2,
                child: Text(
                  "TODO App",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 40,
                  ),
                ),
              ),
            ],
          );
        }
        return Row(
          children: [
            Flexible(
              child: Image.asset(
                "assets/todolist.png",
                fit: BoxFit.contain,
              ),
            ),
            Flexible(
              child: Text(
                "TODO App",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 40,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
