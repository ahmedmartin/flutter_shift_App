import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shieft/controller/shift_controller.dart';
import 'package:shieft/repository/shift_repo/shift_repo_api.dart';
import '../../component/shift/Gridview.dart';
import '../../component/shift/buttomBar.dart';
import '../../component/shift/colorDescription.dart';



class Shift extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    Shift_controller _shift_controller= Get.put(Shift_controller());
    _shift_controller.shift_repo = Shift_repo_api();
    _shift_controller.get_shift_details_in_month();

    return Scaffold(
      body:Column(
        children: [
          const SizedBox(height: 30,),
          const Text("جدول الشيفت للموظفين",style: TextStyle(fontSize: 30,color:Color(0xff005194),
              fontWeight: FontWeight.bold),),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Gridview(_shift_controller,0),
                  SizedBox(width: 20,),
                  Gridview(_shift_controller,1)
                ],
              )),
          const SizedBox(height: 10,),
          color_description(_shift_controller),
          buttom_bar(_shift_controller)
        ],
      ),
    );
  }
  
}







