import 'package:flutter/material.dart';
import 'package:shieft/controller/send_message_controller.dart';

import '../../controller/add_user_controller.dart';

class Text_filled_send_message extends StatelessWidget{

  TextEditingController text_controller ;
  String hint;
  Send_message_controller controller;

  Text_filled_send_message(this.text_controller,this.hint,this.controller);

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
            //prefixIcon: Icon(Icons.person),
            labelText: hint
        ),
        controller: text_controller,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20) ,
      ),
    );
  }

}