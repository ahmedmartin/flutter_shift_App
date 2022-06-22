import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shieft/component/send_message/button.dart';
import 'package:shieft/component/send_message/dropdown_departments.dart';
import 'package:shieft/component/send_message/textFilled.dart';
import 'package:shieft/controller/send_message_controller.dart';
import 'package:shieft/repository/department_repo/department_repo_api.dart';
import 'package:shieft/repository/notifications_repo/notification_repo_api.dart';
import 'package:shieft/repository/shift_repo/shift_repo_api.dart';



class Send_message extends StatelessWidget{

  late Send_message_controller controller;

  @override
  Widget build(BuildContext context) {

    controller = Get.put(Send_message_controller());
    controller.dep_repo=Department_repo_api();
    controller.noti_repo=Notification_repo_api();
    controller.get_manger_department();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff005194),
        title: Text('ارسال رساله الى موظفين الاداره',style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text_filled_send_message(controller.message, 'اكتب رسالتك', controller),
          SizedBox(height: 20,),
          Draw_dropdown_department_send_message('اختار الاداره',controller),
          SizedBox(height: 30,),
          Button_send_message('ارسال', controller),
        ],
      ),
    );
  }


}