import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Mylist extends StatelessWidget {
  final bool checkvalue;
  final String taskname;

  final Function(bool?)? onChanged;
  Function(BuildContext)? onPressed;

  Mylist(
      {super.key,
      required this.checkvalue,
      required this.onChanged,
      required this.taskname,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: onPressed,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
        ]),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              color: Colors.amberAccent[400],
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Checkbox(value: checkvalue, onChanged: onChanged),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      softWrap: true,
                      taskname,
                      style: TextStyle(
                          decoration: checkvalue
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          fontSize: 18,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
