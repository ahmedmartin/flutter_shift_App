import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/user_info_controller.dart';
import '../../view/signin.dart';

class Button extends StatelessWidget{

  String text;
  User_info_controller controller;
  Button(this.text,this.controller);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 150,
        height: 50,
        child: Center(child: Text(text,style: const TextStyle(color: Colors.grey,
            fontSize: 25,fontWeight: FontWeight.bold),)) ,
      ),
      onTap: (){
        controller.signin_controller.model= null;
        Get.offAll(Signin());
      },
    );
  }

}