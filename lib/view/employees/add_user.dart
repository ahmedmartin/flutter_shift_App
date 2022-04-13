import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shieft/controller/add_user_controller.dart';




class Add_user extends StatelessWidget{

  TextEditingController user_name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  _Show_dialog(String title,Widget content ){
    Get.defaultDialog(
        title:title,
        titleStyle: const TextStyle(fontSize: 20,color:Color(0xff005194),
            fontWeight: FontWeight.bold),
        content:content,
        onConfirm: ()async{
          // await controller.add_user();
          // Get.snackbar("انتباه", controller.msg,backgroundColor:const Color(0xff005194) ,
          //     colorText:Colors.white,snackPosition: SnackPosition.BOTTOM );
        } ,
        onCancel: (){}
    );
  }

}

class Text_filled extends StatelessWidget{

  TextEditingController text_controller ;
  String hint;
  Add_user_controller controller;

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
      ),
    );
  }

}

