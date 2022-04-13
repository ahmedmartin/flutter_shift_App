import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shieft/controller/signin_controller.dart';
import 'package:shieft/repository/user_repo/user_repo_test.dart';

import 'admin/home.dart';
import 'employees/shift.dart';


class Signin extends StatelessWidget{

  TextEditingController email_controller = TextEditingController();
  TextEditingController pass_controller = TextEditingController();

  Signin_controller _signin_controller = Get.put(Signin_controller());

  @override
  Widget build(BuildContext context) {

    _signin_controller.signin_repo  = User_repo_test();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Image.asset("assets/jobs.gif",height: 200,width: 300,),
            SizedBox(height: 40,),
            Text_filled(email_controller,"Email", false),
            SizedBox(height: 20,),
            Text_filled(pass_controller, "Password", true),
            SizedBox(height: 30,),
            Button("SignIn",email_controller,pass_controller,_signin_controller)
          ],
        ),
      ),
    );
  }

}

class Text_filled extends StatelessWidget{

  TextEditingController text_controller ;
  String hint;
  bool password;

  Text_filled(this.text_controller,this.hint,this.password);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30,left: 30),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hint+"...",
            border:OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            prefixIcon: password ? GestureDetector(
              child:  Icon(//login_controller.show_pass.value ?
              Icons.remove_red_eye_outlined
              //     :Icons.visibility_off_outlined
              //   , color: Colors.black38,
              //   size: 20,
               ),
              onTap: () {
                // login_controller.show_pass.value = !login_controller.show_pass.value;
                // print(login_controller.show_pass.value);
              },
            ):Icon(Icons.person),
            labelText: hint
        ),
        obscuringCharacter: '*',
        obscureText: password,
        controller: text_controller,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20) ,
      ),
    );
  }

}

class Button extends StatelessWidget{

  String text;
  TextEditingController email;
  TextEditingController pass;
  Signin_controller controller;
  Button(this.text,this.email,this.pass,this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(()=> controller.wait.value?
    const CircularProgressIndicator()
        :GestureDetector(
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.blue[900]
        ),
        child: Center(child: Text(text,style: const TextStyle(color: Colors.white,
            fontSize: 20,fontWeight: FontWeight.bold),)) ,
      ),
      onTap: ()async{
        await controller.signin(email.text, pass.text);
        if(controller.model == null){
          Get.snackbar('لم يتم تسجيل الدخول',"تأكد من بياناتك الشخصيه",backgroundColor: Color(0xff005194)
              ,colorText:Colors.white,snackPosition: SnackPosition.BOTTOM );
        }else{
          if(controller.model!.role=="admin"){
            Get.off(Home());
          }else{
            Get.off(Shift());
          }
        }
        // if(email.text=="admin@mcit.com"&&pass.text=="123456"){
        //   Get.to(Home());
        // }else if((email.text=="manger@mcit.com"||email.text=="employee@mcit.com")&&pass.text=="123456"){
        //   Get.off(Shift());
        // }else{
        //   Get.snackbar('UnAuthorized',"Invalid email and password"
        //       ,colorText:const Color(0xff005194),snackPosition: SnackPosition.BOTTOM );
        // }

      },
    ));
  }

}

