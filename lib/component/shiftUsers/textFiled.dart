import 'package:flutter/material.dart';

import '../../controller/shift_users_controller.dart';

class Text_filled extends StatelessWidget{

  TextEditingController text_controller ;
  String hint;
  Shift_users_controller controller;

  Text_filled(this.text_controller,this.hint,this.controller);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30,left: 30),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hint+"...",
            border:OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            prefixIcon: Icon(Icons.person),
            labelText: hint
        ),
        controller: text_controller,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20) ,
        onChanged: (val){
          controller.search_in_shifts(val);
        },
      ),
    );
  }

}