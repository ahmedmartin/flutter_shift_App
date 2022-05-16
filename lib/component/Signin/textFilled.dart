import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/signin_controller.dart';

class Text_filled extends StatelessWidget{

  TextEditingController text_controller ;
  String hint;
  bool password;
  Signin_controller controller ;

  Text_filled(this.text_controller,this.hint,this.password,this.controller);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30,left: 30),
      child: Obx(()=>TextFormField(
        decoration: InputDecoration(
            hintText: hint+"...",
            border:OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            prefixIcon: password ? GestureDetector(
              child:  Icon(controller.show_pass.value ?
              Icons.visibility_off_outlined
                  :Icons.remove_red_eye_outlined
                , color: Colors.black38,
                size: 20,
              ),
              onTap: () {
                controller.show_pass.value = !controller.show_pass.value;
              },
            ):Icon(Icons.person),
            labelText: hint
        ),
        obscuringCharacter: '*',
        obscureText:!controller.show_pass.value&&password ,
        controller: text_controller,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20) ,
      )),
    );
  }

}