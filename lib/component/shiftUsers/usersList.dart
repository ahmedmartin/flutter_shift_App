import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shieft/component/shiftUsers/addShift.dart';

import '../../controller/shift_users_controller.dart';


class User_list extends StatelessWidget{

  Shift_users_controller controller;

  User_list(this.controller);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:Obx(()=>controller.wait.value?const CircularProgressIndicator():
      ListView.builder(
          itemCount: controller.search_list.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(controller.search_list.value[index].userName!,style: const TextStyle(color:Color(0xff005194),
                  fontWeight: FontWeight.w900 ),),
              trailing: Text(controller.search_list.value[index].shiftName!,style: const TextStyle(color:Color(0xff005194),
                  fontSize: 18,fontWeight: FontWeight.bold),),
              leading: controller.is_manger?IconButton(
                icon:const Icon(Icons.edit,color: Color(0xff005194),size: 20,),
                onPressed: (){
                  //-------update shift-------
                  controller.updated_user_id = controller.search_list.value[index].userId!;
                  controller.updated_shift_id = controller.search_list.value[index].shiftId!;
                  _Show_dialog(controller.date+" :تعديل موظف فى يوم", Add_shift(controller));
                },
              ):const Icon(Icons.remove_red_eye,color: Color(0xff005194),size: 25,),
            subtitle:Text(controller.search_list.value[index].depName!,style: const TextStyle(color:Color(0xff005194),
                fontWeight: FontWeight.w600 ),) ,
              onTap: () async {
                await controller.get_userbyid(controller.search_list.value[index].userId!);
                _show_dialog();
              },
            );
          })),
    );
  }
  _show_dialog(){
    Get.defaultDialog(
        title: "بيانات الموظف",
        titleStyle:TextStyle(color:Color(0xff005194),fontSize: 30,fontWeight: FontWeight.bold) ,
        content: _Show_user_info(controller)
    );
  }

  _Show_dialog(String title,Widget content ){
    Get.defaultDialog(
        title:title,
        titleStyle: TextStyle(fontSize: 20,color:Color(0xff005194),
            fontWeight: FontWeight.bold),
        content:content,
        onConfirm: ()async{
          await controller.edit_shift();
          Get.back();
          Get.snackbar("انتباه", controller.msg,backgroundColor:Color(0xff005194) ,
              colorText:Colors.white,snackPosition: SnackPosition.BOTTOM );
        } ,
        onCancel: (){}
    );
  }
}

class _Show_user_info extends StatelessWidget{

  Shift_users_controller controller;
  _Show_user_info(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Column(
        children: [
          _show_Text(controller.user_details_model.userName!," اسم الموظف "),
          _show_Text(controller.user_details_model.depName!," الاداره "),
          _show_Text(controller.user_details_model.roleName!," دور الموظف فى الاداره "),
          _show_Text(controller.user_details_model.email!," ايميل الموظف "),
          _show_Text(controller.user_details_model.employeeNumber!," الرقم الوظيفى "),
          _show_Text(controller.user_details_model.entryTelephone!," الرقم الداخلى "),
          _show_Text(controller.user_details_model.telephone!," الرقم الشخصى "),
        ],
      ),
    );
  }

  Widget _show_Text(String title, String text){
    //return Text(text,style: TextStyle(color:Color(0xff005194),),);
    return ListTile(
      title:Text(title,style: TextStyle(color:Color(0xff005194),fontWeight: FontWeight.w700),) ,
      trailing:Text(text,style: TextStyle(color:Color(0xff005194),fontWeight: FontWeight.w900),) ,
    );
  }

}



