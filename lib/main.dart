import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var brightness = Brightness.dark;
  void toggleBrightness() {
    setState(() {
      brightness =
          brightness == Brightness.light ? Brightness.dark : Brightness.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoaderScreen(
        function: toggleBrightness,
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellowAccent,
          brightness: brightness,
        ),
        textTheme: GoogleFonts.cedarvilleCursiveTextTheme().copyWith(
          displayLarge: GoogleFonts.abel(
            fontSize: 20,
            color: Colors.red,
          ),
        ),

        // TextTheme(
        //   displayLarge: TextStyle(
        //     fontSize: 20,
        //     color: Colors.red,
        //   ),
        // ),
      ),
    );
  }
}
