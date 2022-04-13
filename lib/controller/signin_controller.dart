import 'dart:async';

import 'package:get/get.dart';
import 'package:shieft/model/signin_model.dart';
import 'package:shieft/repository/user_repo/user_repo.dart';




class Signin_controller extends GetxController{

  RxBool wait =false.obs;
  RxBool show_pass = true.obs;
  bool ?login;
  Signin_model ?model;
  User_repo ?signin_repo;



  signin (String email, String pass) async{

    wait.value= true;
    var login = await signin_repo!.login( email,  pass);
    if(login.runtimeType!=String){
      model=login;
    }
    wait.value=false;
  }


}