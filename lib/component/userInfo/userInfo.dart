import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/user_details_model.dart';

class Show_user_info extends StatelessWidget{

  User_details_model _user_details_model;
  Show_user_info(this._user_details_model);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Column(
        children: [
          _show_Text(_user_details_model.depName!," اداره الموظف "),
          _show_Text(_user_details_model.email!," ايميل الموظف "),
          _show_Text(_user_details_model.employeeNumber!," الرقم الوظيفى "),
          _show_Text(_user_details_model.entryTelephone!," الرقم الداخلى "),
          _show_Text(_user_details_model.telephone!," الرقم الشخصى "),
          _show_Text(_user_details_model.roleName!," دور الموظف فى الاداره "),
        ],
      ),
    );
  }

  Widget _show_Text(String title, String text){
    //return Text(text,style: TextStyle(color:Color(0xff005194),),);
    return ListTile(
      title:Text(title,style: TextStyle(color:Color(0xff005194),fontSize: 20,),) ,
      trailing:Text(text,style: TextStyle(color:Color(0xff005194),fontSize: 20,fontWeight: FontWeight.bold),) ,
    );
  }

}