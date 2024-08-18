import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/todo_practice/database.dart';
import 'package:myapp/todo_practice/myList.dart';
import 'package:myapp/todo_practice/mynewtask.dart';

class HomepageNew extends StatefulWidget {
  const HomepageNew({super.key});

  @override
  State<HomepageNew> createState() => _HomepageState();
}

class _HomepageState extends State<HomepageNew> {
  final _mybox = Hive.box("MyData");
  final TextEditingController _controller = TextEditingController();
  DataBase db = DataBase();
  // List<dynamic> item = [
  //   ['First Work', false],
  //   ['second Work', false]
  // ];
  @override
  void initState() {
    if (_mybox.get("item") == null) {
      db.initialOpen();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void newBox() {
    showDialog(
        context: context,
        builder: (context) {
          return Mynewtask(
            controller: _controller,
            onPressed: () {
              if (_controller.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("type a task please")));
              } else {
                setState(() {
                  db.item.add([_controller.text, false]);
                  _controller.clear();
                });
                db.updateData();
                Navigator.of(context).pop();
              }
            },
          );
        });
  }

  void whenClick(int index) {
    setState(() {
      db.item[index][1] = !db.item[index][1];
    });
    db.updateData();
  }

  // void _dismissible(index) {
  //   item.removeAt(index);
  // }
  void deletetask(index) {
    setState(() {
      db.item.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO LIST "),
        backgroundColor: Colors.amber,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: newBox,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: ListView.builder(
          itemCount: db.item.length,
          itemBuilder: (contex, index) {
            return Mylist(
              onPressed: (p0) => deletetask(index),
              checkvalue: db.item[index][1],
              onChanged: (value) => whenClick(index),
              taskname: db.item[index][0],
            );
          }),
    );
  }
}
