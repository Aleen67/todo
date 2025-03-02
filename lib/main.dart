import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:myapp/todo_practice/homepage.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("MyData");
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          primarySwatch: Colors.amber),
      home: const HomepageNew(),
    );
  }
}
