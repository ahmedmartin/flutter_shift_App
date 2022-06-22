import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shieft/controller/signin_controller.dart';
import 'package:shieft/model/department_model.dart';
import 'package:shieft/model/users_model.dart';
import 'package:shieft/repository/department_repo/department_repo.dart';
import 'package:shieft/repository/user_repo/user_repo.dart';




class Add_user_controller extends GetxController{
  RxList <Department_model>department_list =[Department_model()].obs;
  RxInt department_id=0.obs;
  RxBool wait = false.obs;
  String msg = '';
  late Department_repo dep_repo;
  late User_repo user_repo;
  Department_model ?department_model;
  Signin_controller _signin_controller = Get.find();

  //-----------
  TextEditingController user_name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController entry_telephone = TextEditingController();
  TextEditingController employee_num = TextEditingController();
  //--------------

  get_manger_department()async{
    department_list.value = await dep_repo.get_manger_departments(_signin_controller.model!.userId!);
  }

  add_user()async{
    wait.value = true;
    if(check_entity_notEmpty()) {
      var temp = await user_repo.add_user(
          user_name.text,
          email.text,
          pass.text,
          telephone.text,
          entry_telephone.text,
          department_id.value,
          employee_num.text);
      if (temp.runtimeType == users_model) {
        msg = 'تم اضافه الموظف بنجاح فى الاداره';
      } else {
        msg = temp;
      }
    }else{
      msg = 'يرجى ملئ جميع الحقول';
    }
    wait.value=false;
  }

  bool check_entity_notEmpty(){
    if(user_name.text.isEmpty) return false;
    if(email.text.isEmpty) return false;
    if(pass.text.isEmpty) return false;
    if(telephone.text.isEmpty) return false;
    if(entry_telephone.text.isEmpty) return false;
    if(employee_num.text.isEmpty) return false;
    if(department_id.value==0) return false;
    return true;
  }

}