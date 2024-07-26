import 'package:flutter/material.dart';

class Mylist extends StatelessWidget {
  final bool checkvalue;
  final String taskname ;
  final Function(bool?)? onChanged;


  const Mylist({super.key,
  required this.checkvalue,
  required this.onChanged,
  required this.taskname});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(
              right: 20,left: 20,top: 20
            ),
            child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.amberAccent[400],
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Checkbox(value:checkvalue, onChanged: 
                          onChanged
                        ),
                        const SizedBox(width: 30,),
                       Text(taskname,style: TextStyle(
                        decoration: checkvalue? TextDecoration.lineThrough:TextDecoration.none,
                        fontSize: 18,
                        fontWeight: FontWeight.w200
                       ),)
                      ],
                    ),
                  ),
            ),
          );
  }
}