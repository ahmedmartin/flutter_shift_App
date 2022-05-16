import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/shift_controller.dart';

class color_description extends StatelessWidget{
  Shift_controller controller;
  color_description(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,width: Get.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            //------ if user manger show color description-------
            if(controller.is_manger!)
              Row(
                children: [
                  _Draw_item(Colors.blue.shade600, "لديك موظفين "),//manger
                  _Draw_item(Colors.grey, "ليس لديك موظفين "),//manger
                ],
              ),
            if(controller.is_manger!)
              _Draw_item(Colors.green, "لديك شيفت"),

            //----------is user not manger show color description-------
            if(!controller.is_manger!)
              Row(
                children: [
                  _Draw_item(Colors.green, "لديك شيفت"),//not manger
                  _Draw_item(Colors.grey, "ليس لديك شيفت"),//not manger
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _Draw_item(Color color , String title){
    return Container(
      width: Get.width/2,
      child: ListTile(
          title: Text(title,style: TextStyle(color: color,fontWeight: FontWeight.bold),),
          trailing: Container(
            height: 20,width: 20,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20)
            ),
          )
      ),
    );
  }

}