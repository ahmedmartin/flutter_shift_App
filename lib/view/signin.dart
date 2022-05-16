import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shieft/controller/signin_controller.dart';
import 'package:shieft/repository/user_repo/user_repo_api.dart';
import 'package:shieft/repository/user_repo/user_repo_test.dart';

import '../component/Signin/button.dart';
import '../component/Signin/textFilled.dart';
import 'admin/home.dart';
import 'employees/shift.dart';


class Signin extends StatelessWidget{

  TextEditingController email_controller = TextEditingController();
  TextEditingController pass_controller = TextEditingController();

  Signin_controller _signin_controller = Get.put(Signin_controller());

  @override
  Widget build(BuildContext context) {

    _signin_controller.signin_repo  = User_repo_api();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Image.asset("assets/jobs.gif",height: 200,width: 300,),
            SizedBox(height: 40,),
            Text_filled(email_controller,"Email", false,_signin_controller),
            SizedBox(height: 20,),
            Text_filled(pass_controller, "Password", true,_signin_controller),
            SizedBox(height: 30,),
            Button("SignIn",email_controller,pass_controller,_signin_controller)
          ],
        ),
      ),
    );
  }

}





