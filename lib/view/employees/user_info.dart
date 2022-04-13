import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shieft/controller/user_info_controller.dart';
import 'package:shieft/model/user_details_model.dart';
import 'package:shieft/repository/user_repo/user_repo_test.dart';



class User_info  extends StatelessWidget{

  User_info_controller controller= Get.put(User_info_controller());
  User_info(){
    controller.user_repo=User_repo_test();
    controller.get_user();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx((value){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            _Draw_page_header(value!),
            SizedBox(height: 30,),
            _Show_user_info(value)

          ],
        );
      }),
    );
  }

}

class _Show_user_info extends StatelessWidget{

  User_details_model _user_details_model;
  _Show_user_info(this._user_details_model);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Column(
        children: [
          _show_Text(_user_details_model.userName!," اسم الموظف "),
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

class _Draw_page_header extends StatelessWidget{

  User_details_model _user_details_model;
  _Draw_page_header(this._user_details_model);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: Get.width,
      decoration: const BoxDecoration(
          color: Color(0xff005194),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70)
          )
      ),
      child: Column(
        children: [
          const SizedBox(height: 40,),
          const CircleAvatar(backgroundImage: AssetImage('assets/user_profile.gif'),
            radius: 80 ,backgroundColor: Colors.white,),
           const SizedBox(height: 20,),
          Text(_user_details_model.userName!,style: const TextStyle(fontSize: 25,
              color: Colors.white,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }

}



