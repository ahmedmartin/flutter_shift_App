import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shieft/controller/shift_users_controller.dart';
import 'package:shieft/model/department_model.dart';
import 'package:shieft/model/shift_type_model.dart';
import 'package:shieft/model/user_bydepartment_model.dart';
import 'package:shieft/repository/department_repo/department_repo_test.dart';
import 'package:shieft/repository/shift_repo/shift_repo_test.dart';
import 'package:shieft/repository/user_repo/user_repo_test.dart';



class Shift_users extends StatelessWidget{

  TextEditingController search = TextEditingController();
  late Shift_users_controller controller ;

  Shift_users(var year_month_day){
    controller = Get.put(Shift_users_controller());
    controller.date = year_month_day[2]+'-'+year_month_day[1]+'-'+year_month_day[0];
    controller.user_repo = User_repo_test();
    controller.shift_repo= Shift_repo_test();
    controller.dep_repo= Department_repo_test();
    controller.get_shifts_in_day();
    controller.get_department();
    controller.get_shift_type();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: WillPopScope( onWillPop: ()async{controller.dispose(); return true;},
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Text(controller.date+" : الموظفين المسجلين فى يوم",
              style: const TextStyle(fontSize: 20,color:Color(0xff005194), fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            Text_filled(search, "البحث بالاسم و الاداره",controller),
            _User_list(controller),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: controller.is_manger,
        child: FloatingActionButton(
          child: Icon(Icons.add,size: 30,color: Colors.white,),
          backgroundColor:Color(0xff005194) ,
          onPressed:(){
             _Show_dialog(controller.date+" :اضافه موظف فى يوم", _Add_shift(controller));
          } ,),
      ),
    );
  }

  _Show_dialog(String title,Widget content ){
    Get.defaultDialog(
        title:title,
        titleStyle: TextStyle(fontSize: 20,color:Color(0xff005194),
            fontWeight: FontWeight.bold),
        content:content,
        onConfirm: ()async{
          await controller.add_shift();
          Get.snackbar("انتباه", controller.msg,backgroundColor:Color(0xff005194) ,
              colorText:Colors.white,snackPosition: SnackPosition.BOTTOM );
        } ,
        onCancel: (){}
    );
  }

}

class _User_list extends StatelessWidget{

  Shift_users_controller controller;

  _User_list(this.controller);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:Obx(()=>controller.wait.value?CircularProgressIndicator():
      ListView.builder(
          itemCount: controller.search_list.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(controller.search_list.value[index].userName!,style: TextStyle(color:Color(0xff005194),fontSize: 25 ),),
              subtitle: Text(controller.search_list.value[index].shiftName!,style: TextStyle(color:Color(0xff005194) ),),
              leading: GestureDetector(
                child: Icon(Icons.edit,color: Color(0xff005194),size: 20,),
                //onTap: ()=>,
              ),
              trailing:Text(controller.search_list.value[index].depName!,style: TextStyle(color:Color(0xff005194),fontWeight: FontWeight.bold ),) ,
              onTap: (){
                // controller.user_model = controller.users_list.singleWhere((element) =>
                // element.userId==controller.search_list.value[index].userId);
                controller.get_userbyid(controller.search_list.value[index].userId!);
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
      title:Text(title,style: TextStyle(color:Color(0xff005194),fontSize: 20,),) ,
      trailing:Text(text,style: TextStyle(color:Color(0xff005194),fontSize: 20,fontWeight: FontWeight.bold),) ,
    );
  }

}

class _Add_shift extends StatelessWidget{

  Shift_users_controller controller;
  _Add_shift(this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
          const SizedBox(height: 10,),
        _Draw_dropdown_department('اختار الاداره',controller),
        const SizedBox(height: 30,),
         _Draw_dropdown_users('اختار موظف',controller),
         const SizedBox(height: 30,),
         _Draw_dropdown_shift_type('اختار نوع الشيفت',controller),
        const SizedBox(height: 20,),
      ],
    );
  }

}

class _Draw_dropdown_users extends StatelessWidget{

  Shift_users_controller controller;
   String hint;
  _Draw_dropdown_users(this.hint,this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration:BoxDecoration(
          border: Border.all(color: Color(0xff005194),width:3 ),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding:  const EdgeInsets.only(left: 30,right: 30),
        //--------show projects (spinner)--------------------------
        child: Obx(()=> DropdownButton(
          items: controller.dropdwon_users_list.value.map((val)=>DropdownMenuItem(
              child:val.userName==null?CircularProgressIndicator():Text(val.userName!),value: val)).toList(),
          hint: Text(hint,style: TextStyle(color:Color(0xff005194),fontSize: 20,
              fontWeight: FontWeight.bold),textAlign: TextAlign.center,) ,
          value: controller.user_id.value.isEqual(0)?null:controller.user_model ,
          icon: const Icon(Icons.arrow_drop_down_circle,color:Color(0xff005194),),
          style: const TextStyle(color:Color(0xff005194),fontSize: 20,
              fontWeight: FontWeight.bold),
          onChanged: (val){
             controller.user_model = (val as User_bydepartment_model);
             controller.user_id.value=controller.user_model!.userId!;
          },
        )),
      ),
    );
  }
}

class _Draw_dropdown_department extends StatelessWidget{

  Shift_users_controller controller;
  String hint;
  _Draw_dropdown_department(this.hint,this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration:BoxDecoration(
          border: Border.all(color: Color(0xff005194),width:3 ),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding:  const EdgeInsets.only(left: 30,right: 30),
        //--------show projects (spinner)--------------------------
        child: Obx(()=> DropdownButton(
          items: controller.department_list.value.map((val)=>DropdownMenuItem(
              child:val.depName==null?CircularProgressIndicator():Text(val.depName!),value: val)).toList(),
          hint: Text(hint,style: TextStyle(color:Color(0xff005194),fontSize: 20,
              fontWeight: FontWeight.bold),textAlign: TextAlign.center,) ,
          value: controller.department_id.value.isEqual(0)?null:controller.department_model ,
          icon: const Icon(Icons.arrow_drop_down_circle,color:Color(0xff005194),),
          style: const TextStyle(color:Color(0xff005194),fontSize: 20,
              fontWeight: FontWeight.bold),
          onChanged: (val){
            controller.department_model = (val as Department_model);
            controller.department_id.value=controller.department_model!.depId!;
            controller.get_users_bydepartment();
          },
        )),
      ),
    );
  }
}

class _Draw_dropdown_shift_type extends StatelessWidget{

  Shift_users_controller controller;
  String hint;
  _Draw_dropdown_shift_type(this.hint,this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration:BoxDecoration(
          border: Border.all(color: Color(0xff005194),width:3 ),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding:  const EdgeInsets.only(left: 30,right: 30),
        //--------show projects (spinner)--------------------------
        child: Obx(()=> DropdownButton(
          items: controller.shift_type_list.value.map((val)=>DropdownMenuItem(child:Text(val.shiftName!),value: val)).toList(),
          hint: Text(hint,style: const TextStyle(color: Color(0xff005194),fontSize: 20,
              fontWeight: FontWeight.bold),textAlign: TextAlign.center,) ,
          value: controller.shift_type_id.value.isEqual(0)?null: controller.shift_type_model ,//add_controller!.department.value.isEmpty? null: add_controller!.selected_depart_model ,
          icon: const Icon(Icons.arrow_drop_down_circle,color:Color(0xff005194),),
          style: const TextStyle(color:Color(0xff005194),fontSize: 20,
              fontWeight: FontWeight.bold),
          onChanged: (val){
            controller.shift_type_model = (val as Shift_type_model);
            controller.shift_type_id.value=controller.shift_type_model!.shiftTypeId!;
            // add_controller!.department.value = (val as Depart_model).name!;
            // add_controller!.department_id = (val as Depart_model).id!.toString();

          },
        )),
      ),
    );
  }
}

class Text_filled extends StatelessWidget{

  TextEditingController text_controller ;
  String hint;
  Shift_users_controller controller;

  Text_filled(this.text_controller,this.hint,this.controller);

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
            prefixIcon: Icon(Icons.person),
            labelText: hint
        ),
        controller: text_controller,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20) ,
        onChanged: (val){
          controller.search_in_shifts(val);
        },
      ),
    );
  }

}

