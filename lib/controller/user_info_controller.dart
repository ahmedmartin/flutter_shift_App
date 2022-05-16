import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shieft/controller/signin_controller.dart';
import 'package:shieft/model/user_details_model.dart';
import 'package:shieft/repository/user_repo/user_repo.dart';



class User_info_controller extends GetxController with StateMixin<User_details_model>{

  late User_repo user_repo;
  Signin_controller _signin_controller = Get.find();
  TextEditingController new_pass = TextEditingController();
  late String msg;



  get_user(){
    user_repo.get_users_byid(_signin_controller.model!.userId!).
    then((value) => change(value, status: RxStatus.success()));
  }

  change_pass(User_details_model model) async {
    msg = await user_repo.change_pass(new_pass.text, model);
  }


}