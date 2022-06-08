import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shieft/controller/shift_users_controller.dart';
import 'package:shieft/repository/department_repo/department_repo_api.dart';
import 'package:shieft/repository/shift_repo/shift_repo_api.dart';
import 'package:shieft/repository/user_repo/user_repo_api.dart';
import 'package:shieft/view/employees/shift.dart';

import '../../component/shiftUsers/addShift.dart';
import '../../component/shiftUsers/textFiled.dart';
import '../../component/shiftUsers/usersList.dart';
import '../../repository/notifications_repo/notification_repo_api.dart';



class Shift_users extends StatelessWidget{

  TextEditingController search = TextEditingController();
  late Shift_users_controller controller ;

  Shift_users(var year_month_day){
    controller = Get.put(Shift_users_controller());
    controller.date = year_month_day[2]+'-'+year_month_day[1]+'-'+year_month_day[0];
    controller.user_repo = User_repo_api();
    controller.shift_repo= Shift_repo_api();
    controller.dep_repo= Department_repo_api();
    controller.noti_repo=Notification_repo_api();
    controller.get_shifts_in_day();
    controller.get_manger_department();
    controller.get_shift_type();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(controller.date+" : الموظفين فى يوم",
          style: TextStyle(color:Colors.white),) ,
        backgroundColor: const Color(0xff005194),
        actions: [
        Visibility(
        visible: controller.is_manger,
        child:IconButton(
              icon:Icon(Icons.add,size: 30,color: Colors.white,) ,
            onPressed:(){
              _Show_dialog(controller.date+" :اضافه موظف فى يوم", Add_shift(controller));
            }))
        ],
      ),
      body: WillPopScope( onWillPop: ()async{controller.dispose(); Get.offAll(Shift()); return true;},
        child: Column(
          children: [
            // const SizedBox(height: 40,),
            // Text(controller.date+" : الموظفين المسجلين فى يوم",
            //   style: const TextStyle(fontSize: 20,color:Color(0xff005194), fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Text_filled(search, "البحث بالاسم و الاداره",controller),
            User_list(controller),
          ],
        ),
      ),
      // floatingActionButton: Visibility(
      //   visible: controller.is_manger,
      //   child: FloatingActionButton(
      //     child: Icon(Icons.add,size: 30,color: Colors.white,),
      //     backgroundColor:Color(0xff005194) ,
      //     onPressed:(){
      //        _Show_dialog(controller.date+" :اضافه موظف فى يوم", Add_shift(controller));
      //     } ,),
      // ),
    );
  }

  _Show_dialog(String title,Widget content ){
    Get.defaultDialog(
        title:title,
        titleStyle: TextStyle(fontSize: 20,color:Color(0xff005194),
            fontWeight: FontWeight.bold),
        content:content,
        onConfirm: ()async{
            if(! controller.wait_add_or_update_or_remove_shift) {
              await controller.add_shift();
              Get.back();
              Get.snackbar("انتباه", controller.msg, backgroundColor: Color(0xff005194),
                  colorText: Colors.white, snackPosition: SnackPosition.BOTTOM);
            }
        } ,
        onCancel: (){}
    );
  }

}











