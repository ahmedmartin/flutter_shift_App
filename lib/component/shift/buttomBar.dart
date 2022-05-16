import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shieft/view/employees/shift_users_count.dart';

import '../../view/employees/departmen_users.dart';
import '../../view/employees/user_info.dart';

class buttom_bar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            color: Color(0xff005194),
          ),

          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [


              //show all employs on department
              GestureDetector (
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Icon(Icons.supervisor_account,size: 25,color: Color(0xff005194),),
                ),
                onTap: ()=> Get.to(Department_users()),
              ),

              //report employee number ber month
              GestureDetector (
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Icon(Icons.article_sharp,size: 25,color: Color(0xff005194),),
                ),

                onTap: ()=> Get.to(Shift_users_count()),
              ),

              //message
              GestureDetector (
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Icon(Icons.email,size: 25,color: Color(0xff005194),),
                ),

                //onTap: ()=> Get.to(User_info()),
              ),

              //employee info
              GestureDetector (
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Icon(Icons.person,size: 25,color: Color(0xff005194),),
                ),

                onTap: ()=> Get.to(User_info()),
              ),

            ],
          ),
        ),
      ),
    );
  }

}