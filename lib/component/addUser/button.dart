import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/add_user_controller.dart';
import '../../view/employees/departmen_users.dart';

class Button extends StatelessWidget{

  String text;
  Add_user_controller controller;
  Button(this.text,this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(()=> controller.wait.value?
    const CircularProgressIndicator()
        :GestureDetector(
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Color(0xff005194)
        ),
        child: Center(child: Text(text,style: const TextStyle(color: Colors.white,
            fontSize: 20,fontWeight: FontWeight.bold),)) ,
      ),
      onTap: ()async{
        await controller.add_user();
        if(controller.msg.contains('بنجاح')) {
          Get.off(Department_users());
        }
        Get.snackbar("انتباه", controller.msg, backgroundColor: Color(0xff005194),
            colorText: Colors.white, snackPosition: SnackPosition.BOTTOM);
      },
    ));
  }

}