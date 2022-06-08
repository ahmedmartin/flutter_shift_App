import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/user_info_controller.dart';
import '../../model/user_details_model.dart';
import '../../view/signin.dart';

class Draw_page_header extends StatelessWidget{

  User_info_controller controller;
  User_details_model _user_details_model;
  Draw_page_header(this._user_details_model,this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: Get.width,
      decoration: const BoxDecoration(
          color: Color(0xff005194),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70)
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
         // const SizedBox(height: 20,),
          IconButton(
              padding: EdgeInsets.only(right: 30),
              icon: Icon(Icons.edit,size: 30,color: Colors.white,),
              onPressed: (){
                _show_dialog();
              }),
          const Center(
            child: CircleAvatar(backgroundImage: AssetImage('assets/user_profile.gif'),
              radius: 70 ,backgroundColor: Colors.white,),
          ),
          const SizedBox(height: 20,),
          Center(
            child: Text(_user_details_model.userName!,style: const TextStyle(fontSize: 25,
                color: Colors.white,fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }

  _show_dialog(){
    Get.defaultDialog(
        title: 'تغير الرقم السرى',
        content: _Text_filled(controller.new_pass, 'الرقم السرى الجديد', controller),
        onConfirm: () async {
          await controller.change_pass(_user_details_model);
          if(controller.msg.contains('تم تغير الرقم السرى')){
            Get.offAll(Signin());
          }
          Get.snackbar("انتباه", controller.msg, backgroundColor: Color(0xff005194),
              colorText: Colors.white, snackPosition: SnackPosition.BOTTOM);
        },
        onCancel: (){}
    );
  }
}

class _Text_filled extends StatelessWidget{

  TextEditingController text_controller ;
  String hint;
  User_info_controller controller;

  _Text_filled(this.text_controller,this.hint,this.controller);

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
            labelText: hint
        ),
        controller: text_controller,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20) ,
      ),
    );
  }

}