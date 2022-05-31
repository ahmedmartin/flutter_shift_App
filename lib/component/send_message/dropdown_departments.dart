import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shieft/controller/send_message_controller.dart';

import '../../controller/add_user_controller.dart';
import '../../model/department_model.dart';

class Draw_dropdown_department_send_message extends StatelessWidget{

  Send_message_controller controller;
  String hint;
  Draw_dropdown_department_send_message(this.hint,this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(()=> DropdownButton(
      items: controller.department_list.value.map((val)=>DropdownMenuItem(
          child:val.depName==null?CircularProgressIndicator():Text(val.depName!),value: val)).toList(),
      hint: Text(hint,style: TextStyle(color:Color(0xff005194),fontSize: 20,
          fontWeight: FontWeight.bold),textAlign: TextAlign.center,) ,
      value: controller.department_id.value.isEqual(0)?null:controller.department_model ,
      icon: const Icon(Icons.arrow_drop_down,color:Color(0xff005194),),
      style: const TextStyle(color:Color(0xff005194),
          fontWeight: FontWeight.w900),
      onChanged: (val){
        controller.department_model = (val as Department_model);
        controller.department_id.value=controller.department_model!.depId!;
      },
    ));
  }
}