import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shieft/controller/shift_users_count_controller.dart';
import 'package:shieft/repository/shift_repo/shift_repo_api.dart';

import '../../component/shiftUsersCount/user_list.dart';




class Shift_users_count extends StatelessWidget{

  Shift_users_count_controller controller = Get.put(Shift_users_count_controller());

  @override
  Widget build(BuildContext context) {

    controller.shift_repo=Shift_repo_api();
    controller.get_users_count();

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40,),
          Text(DateTime.now().month.toString()+" : كشف للموظفين خلال شهر",
            style: const TextStyle(fontSize: 20,color:Color(0xff005194), fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          controller.obx((value) => User_list(value!)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.send,size: 30,color: Colors.white,),
        backgroundColor:const Color(0xff005194) ,
        onPressed:(){

        } ,),
    );
  }

}


