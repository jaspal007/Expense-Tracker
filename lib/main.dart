import 'package:flutter/material.dart';

import 'widget/expenses.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 235, 209, 240),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Expenses(),
    );
  }
}
