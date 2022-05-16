import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/shift_users_controller.dart';
import '../../model/department_model.dart';
import '../../model/shift_type_model.dart';
import '../../model/users_model.dart';

class Add_shift extends StatelessWidget{

  Shift_users_controller controller;
  Add_shift(this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        const SizedBox(height: 10,),
        _Draw_dropdown_department('اختار الاداره',controller),
        const SizedBox(height: 30,),
        _Draw_dropdown_users('اختار موظف',controller),
        const SizedBox(height: 30,),
        _Draw_dropdown_shift_type('اختار نوع الشيفت',controller),
        const SizedBox(height: 20,),
      ],
    );
  }

}


class _Draw_dropdown_department extends StatelessWidget{

  Shift_users_controller controller;
  String hint;
  _Draw_dropdown_department(this.hint,this.controller);

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
        controller.get_users_bydepartment();
      },
    ));
  }
}

class _Draw_dropdown_users extends StatelessWidget{

  Shift_users_controller controller;
  String hint;
  _Draw_dropdown_users(this.hint,this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(()=> DropdownButton(
      items: controller.dropdwon_users_list.value.map((val)=>DropdownMenuItem(
          child:val.userName==null?CircularProgressIndicator():Text(val.userName!),value: val)).toList(),
      hint: Text(hint,style: TextStyle(color:Color(0xff005194),fontSize: 20,
          fontWeight: FontWeight.bold),textAlign: TextAlign.center,) ,
      value: controller.user_id.value.isEqual(0)?null:controller.user_model ,
      icon: const Icon(Icons.arrow_drop_down,color:Color(0xff005194),),
      style: const TextStyle(color:Color(0xff005194),
          fontWeight: FontWeight.w900),
      onChanged: (val){
        controller.user_model = (val as users_model);
        controller.user_id.value=controller.user_model!.userId!;
      },
    ));
  }
}

class _Draw_dropdown_shift_type extends StatelessWidget{

  Shift_users_controller controller;
  String hint;
  _Draw_dropdown_shift_type(this.hint,this.controller);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.only(left: 30,right: 30),
      //--------show projects (spinner)--------------------------
      child: Obx(()=> DropdownButton(
        items: controller.shift_type_list.value.map((val)=>DropdownMenuItem(child:Text(val.shiftName!),value: val)).toList(),
        hint: Text(hint,style: const TextStyle(color: Color(0xff005194),fontSize: 20,
            fontWeight: FontWeight.bold),textAlign: TextAlign.center,) ,
        value: controller.shift_type_id.value.isEqual(0)?null: controller.shift_type_model ,//add_controller!.department.value.isEmpty? null: add_controller!.selected_depart_model ,
        icon: const Icon(Icons.arrow_drop_down,color:Color(0xff005194),),
        style: const TextStyle(color:Color(0xff005194),fontSize: 17,
            fontWeight: FontWeight.bold),
        onChanged: (val){
          controller.shift_type_model = (val as Shift_type_model);
          controller.shift_type_id.value=controller.shift_type_model!.shiftTypeId!;
        },
      )),
    );
  }
}