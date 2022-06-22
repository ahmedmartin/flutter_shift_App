import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shieft/model/signin_model.dart';
import 'package:shieft/repository/user_repo/user_repo.dart';
import 'package:shieft/repository/user_repo/user_repo_api.dart';




class Signin_controller extends GetxController{

  RxBool wait =false.obs;
  RxBool show_pass = false.obs;
  bool ?login;
  Signin_model ?model;
  User_repo ?signin_repo;




  signin (String email, String pass) async{



    wait.value= true;
    var temp = await signin_repo!.login( email,pass);
    if(temp.runtimeType!=String){
      model=Signin_model.fromJson(temp);
      FirebaseMessaging.instance.subscribeToTopic(model!.deptId.toString());
    }
    wait.value=false;
  }


}