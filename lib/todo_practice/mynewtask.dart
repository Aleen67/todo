// import 'dart:js_interop';

import 'package:flutter/material.dart';

class Mynewtask extends StatelessWidget {
  
  final  controller;
  
  VoidCallback onPressed;
   Mynewtask({super.key,required this.onPressed,required this.controller});

   TextEditingController mycontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return   AlertDialog(
      content: SizedBox(
        height: 120,
        
        // decoration: BoxDecoration(
        //   color: Colors.amber
        // ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                 TextField(
                   controller: controller,
                   decoration:const InputDecoration(
                     hintText: "Enter a task...",
                     border: OutlineInputBorder()
                   ),
                 ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed:onPressed,
                    child:const  Text("Save"),
                    ),

                    MaterialButton(onPressed:(){
                      Navigator.of(context).pop();
                    },
                    child:const  Text("Cencel"),)
                  ],
                )
          ],
        ),
      ),
    );
  }
}
