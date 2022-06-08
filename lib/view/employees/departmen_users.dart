import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shieft/component/departmentUsers/list.dart';
import 'package:shieft/controller/department_users_controller.dart';
import 'package:shieft/model/users_model.dart';
import 'package:shieft/repository/user_repo/user_repo_api.dart';
import 'package:shieft/repository/user_repo/user_repo_test.dart';
import 'package:shieft/view/employees/add_user.dart';




class Department_users extends StatelessWidget{

  late Department_users_controller controller;

  Department_users(){
    controller = Get.put(Department_users_controller());
    controller.user_repo=User_repo_api();
    controller.get_users_byDepartment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xff005194) ,
        title: Text("بيانات موظفين الاداره",
        style: const TextStyle(fontSize: 20,color:Colors.white, fontWeight: FontWeight.bold),) ,
      ),
      body: controller.obx((value) => User_list(value!)),
      floatingActionButton: Visibility(
        visible: controller.is_manger(),
        child: FloatingActionButton(
          child: const Icon(Icons.add,size: 30,color: Colors.white,),
          backgroundColor:const Color(0xff005194) ,
          onPressed:(){
            Get.off(Add_user());
          } ,),
      ),
    );
  }

}





