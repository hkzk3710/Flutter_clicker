import 'package:flutter/material.dart';
import '../models/counter_model.dart';

import 'screens/main_screen.dart';

void main() {
  runApp(const Main());
}

// MyAppをStatefullにして、状態を管理する

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Clicker',
        count: CounterModel(),
      ),
    );
  }
}
