import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shieft/component/userInfo/userInfo.dart';
import 'package:shieft/controller/user_info_controller.dart';
import 'package:shieft/model/user_details_model.dart';
import 'package:shieft/repository/user_repo/user_repo_api.dart';
import 'package:shieft/repository/user_repo/user_repo_test.dart';
import 'package:shieft/view/signin.dart';

import '../../component/userInfo/button.dart';
import '../../component/userInfo/header.dart';



class User_info  extends StatelessWidget{

  User_info_controller controller= Get.put(User_info_controller());
  User_info(){
    controller.user_repo=User_repo_api();
    controller.get_user();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx((value){
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Draw_page_header(value!,controller),
              SizedBox(height: 30,),
              Show_user_info(value),
              SizedBox(height: 20,),
              Button('Sign out', controller)
            ],
          ),
        );
      }),
    );
  }

}











