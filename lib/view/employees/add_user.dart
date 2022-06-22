import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shieft/controller/add_user_controller.dart';
import 'package:shieft/model/department_model.dart';
import 'package:shieft/repository/department_repo/department_repo_test.dart';
import 'package:shieft/repository/user_repo/user_repo_api.dart';
import 'package:shieft/repository/user_repo/user_repo_test.dart';
import 'package:shieft/view/employees/departmen_users.dart';

import '../../component/addUser/button.dart';
import '../../component/addUser/dropdwonDepartment.dart';
import '../../component/addUser/textFilled.dart';
import '../../repository/department_repo/department_repo_api.dart';




class Add_user extends StatelessWidget{



  Add_user_controller controller = Get.put(Add_user_controller());
  Add_user(){
    controller.dep_repo = Department_repo_api();
    controller.user_repo = User_repo_api();
    controller.get_manger_department();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: ()async{Get.off(Department_users());return true;},
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff005194),
          title: Text('اضافه موظف جديد',style: TextStyle(color: Colors.white),),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Text_filled(controller.user_name, 'اسم الموظف', controller),
              const SizedBox(height: 20,),
              Text_filled(controller.email, 'الايميل الالكترونى', controller),
              const SizedBox(height: 20,),
              Text_filled(controller.pass, 'كلمه سر مؤقته', controller),
              const SizedBox(height: 20,),
              Text_filled(controller.telephone, 'رقم الهاتف الشخصى', controller),
              const SizedBox(height: 20,),
              Text_filled(controller.entry_telephone, 'رقم الهاتف الداخلى', controller),
              const SizedBox(height: 20,),
              Text_filled(controller.employee_num, 'الرقم الوظيفى للموظف', controller),
              const SizedBox(height: 20,),
              Draw_dropdown_department('اختار الاداره للموظف', controller),
              const SizedBox(height: 40,),
              Button('اضافه موظف', controller),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }

}







