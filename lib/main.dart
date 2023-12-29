import 'package:debouncing_and_throttling_demo/screens.dart/home_screen.dart';
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
      title: 'Debouncing and Throttling',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFEFAE0),background: const Color(0xFFFEFAE0)),
        useMaterial3: true,
      ),
      home: MyHomePage(title: "Debouncing and Throttling"),
    );
  }
}
