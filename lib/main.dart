import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist/screens/home_page.dart';
import 'package:todolist/screens/loader_screen.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) {
      return const MyApp();
    },
  ));
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
  var _brightness = Brightness.light;
  void changeBrightness() {
    print("Brightness");
    setState(() {
      if (_brightness == Brightness.dark) {
        _brightness = Brightness.light;
      } else {
        _brightness = Brightness.dark;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoaderScreen(
        changeTheme: changeBrightness,
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
          brightness: _brightness,
        ),
        textTheme: GoogleFonts.cedarvilleCursiveTextTheme().copyWith(
          displayLarge: GoogleFonts.abel(
            fontSize: 20,
            color: Colors.red,
          ),

          // TextStyle(
          //   fontSize: 20,
          //   color: Colors.red,
          //   fontFamily: GoogleFonts.roboto(),
          // ),
        ),
      ),
    );
  }
}
