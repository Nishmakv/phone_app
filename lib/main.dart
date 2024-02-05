import 'package:flutter/material.dart';
import 'package:phone_app/screens/home.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}
