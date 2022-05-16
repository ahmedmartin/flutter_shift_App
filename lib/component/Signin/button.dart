import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/signin_controller.dart';
import '../../view/admin/home.dart';
import '../../view/employees/shift.dart';

class Button extends StatelessWidget{

  String text;
  TextEditingController email;
  TextEditingController pass;
  Signin_controller controller;
  Button(this.text,this.email,this.pass,this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(()=> controller.wait.value?
    const CircularProgressIndicator()
        :GestureDetector(
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.blue[900]
        ),
        child: Center(child: Text(text,style: const TextStyle(color: Colors.white,
            fontSize: 20,fontWeight: FontWeight.bold),)) ,
      ),
      onTap:()async{
        await controller.signin(email.text, pass.text);
        if(controller.model == null){
          Get.snackbar('لم يتم تسجيل الدخول',"تأكد من بياناتك الشخصيه",backgroundColor: Color(0xff005194)
              ,colorText:Colors.white,snackPosition: SnackPosition.BOTTOM );
        }else{
          if(controller.model!.role=="admin"){
            Get.off(Home());
          }else{
            Get.off(Shift());
          }
        }
      } ,
    ));
  }

}