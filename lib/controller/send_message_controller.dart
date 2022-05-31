
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shieft/controller/signin_controller.dart';

import '../model/department_model.dart';
import '../repository/department_repo/department_repo.dart';
import '../repository/shift_repo/shift_repo.dart';



class Send_message_controller extends GetxController{

  RxList <Department_model>department_list =[Department_model()].obs;
  Department_model ?department_model;
  RxInt department_id=0.obs;
  Signin_controller _signin_controller = Get.find();
  late Shift_repo shift_repo;
  late Department_repo dep_repo;
  TextEditingController message = TextEditingController();


  get_manger_department()async{
    department_list.value = await dep_repo.get_manger_departments(_signin_controller.model!.userId!);
  }

  Future<String> push_notification_from_api() async {
    if(department_id==0 || message.text.isEmpty) {
      return 'يجب ادخال جميع البيانات بشكل صحيح';
    }
      return await shift_repo.notification_special_department(' رساله لاداره '+'${department_model!.depName}',
        message.text,
        "https://www.learndash.com/wp-content/uploads/Notification-Add-on.png",
        department_id.toString());

  }

}