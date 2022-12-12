import 'package:flutter/material.dart';
import 'package:flutter_sqlite/screens/home_screen.dart';
import 'package:flutter_sqlite/screens/test_shared.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: "SQFLITE",
      home: HomeScreen(),
    );
  }
}
