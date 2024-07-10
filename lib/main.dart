import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/home_page.dart';
import 'package:todolist/screens/welcome_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static of(BuildContext context) {
    return context.findAncestorStateOfType<_MyAppState>();
  }
}

class _MyAppState extends State<MyApp> {
  var brightness = Brightness.light;
  changeBrightNess() {
    setState(() {
      brightness =
          brightness == Brightness.light ? Brightness.dark : Brightness.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: brightness,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 100,
          ),
          displaySmall: TextStyle(
            fontSize: 12,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
    );
  }
}
