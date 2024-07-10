import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/home_page.dart';
import 'package:todolist/screens/loader_screen.dart';

void main() {
  runApp(DevicePreview(
    enabled: false,
    builder: (context) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoaderScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 20,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
