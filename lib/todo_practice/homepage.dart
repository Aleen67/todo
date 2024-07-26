import 'package:flutter/material.dart';
import 'package:myapp/todo_practice/myList.dart';
import 'package:myapp/todo_practice/mynewtask.dart';

class HomepageNew extends StatefulWidget {
  const HomepageNew({super.key});

  @override
  State<HomepageNew> createState() => _HomepageState();
}

class _HomepageState extends State<HomepageNew> {
  final TextEditingController _controller = TextEditingController();
  List item = [
    ['First Work', false],
    ['second Work', false]
  ];
  // void onSaved() {
  //   setState(() {
  //     item.add([_controller.text, false]);
  //   });
  //   Navigator.of(context).pop();
  // }

  void newBox() {
    showDialog(
        context: context,
        builder: (context) {
          return Mynewtask(
            controller: _controller,
            onPressed: () {
              setState(() {
                item.add([_controller.text, false]);
              });
              Navigator.of(context).pop();
            },
          );
        });
  }

  void whenClick(int index) {
    setState(() {
      item[index][1] = !item[index][1];
    });
  }

  void _dismissible(index) {
    item.removeAt(index);
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
          itemCount: item.length,
          itemBuilder: (contex, index) {
            return Dismissible(
              onDismissed: (direction) {
                _dismissible(index);
              },
              key: Key(item[index]),
              background: Container(
                color: Colors.redAccent,
                child: const Icon(Icons.delete),
              ),
              child: Mylist(
                checkvalue: item[index][1],
                onChanged: (value) => whenClick(index),
                taskname: item[index][0],
              ),
            );
          }),
    );
  }
}
