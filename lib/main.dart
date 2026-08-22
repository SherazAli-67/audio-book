import 'package:audio_book/constants/string_const.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConst.appTitle,
      theme: ThemeData(
        brightness: .light,
        scaffoldBackgroundColor: Colors.white
      ),
      home: Scaffold(body: SafeArea(child: Center(child: Text("AudioBook app"),)),)
    );
  }
}
