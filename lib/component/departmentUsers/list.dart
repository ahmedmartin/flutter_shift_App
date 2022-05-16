import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/users_model.dart';

class User_list extends StatelessWidget{

  List<users_model>all_users;

  User_list(this.all_users);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,width: Get.width,
      child: ListView.builder(
          itemCount: all_users.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(all_users[index].userName!,style: TextStyle(color:Color(0xff005194),fontSize: 20,fontWeight: FontWeight.bold ),),
              subtitle: Text(all_users[index].email!,style: TextStyle(color:Color(0xff005194) ),),
              trailing:Text(all_users[index].employeeNumber!,style: TextStyle(color:Color(0xff005194),fontWeight: FontWeight.bold ),) ,
              onTap: (){
                _show_dialog(all_users[index]);
              },
            );
          }),
    );
  }
  _show_dialog(users_model model){
    Get.defaultDialog(
        title: "بيانات الموظف",
        titleStyle:TextStyle(color:Color(0xff005194),fontSize: 30,fontWeight: FontWeight.bold) ,
        content: _Show_user_info(model)
    );
  }
}

class _Show_user_info extends StatelessWidget{

  users_model model;
  _Show_user_info(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Column(
        children: [
          _show_Text(model.userName!," اسم الموظف "),
          _show_Text(model.email!," ايميل الموظف "),
          _show_Text(model.employeeNumber!," الرقم الوظيفى "),
          _show_Text(model.entryTelephone!," الرقم الداخلى "),
          _show_Text(model.telephone!," الرقم الشخصى "),
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