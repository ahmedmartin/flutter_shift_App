import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blur/blur.dart';
import 'package:shieft/controller/shift_controller.dart';
import 'package:shieft/repository/shift_repo/shift_repo_test.dart';
import 'package:shieft/view/employees/departmen_users.dart';
import 'package:shieft/view/employees/shift_users.dart';
import 'package:shieft/view/employees/user_info.dart';



class Shift extends StatelessWidget{

  Shift_controller _shift_controller= Get.put(Shift_controller());

  @override
  Widget build(BuildContext context) {
    _shift_controller.shift_repo = Shift_repo_test();
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
                  _Gridview(_shift_controller,0),
                  SizedBox(width: 20,),
                  _Gridview(_shift_controller,1)
                ],
              )),
          const SizedBox(height: 10,),
          _color_description(_shift_controller),
          _buttom_bar()
        ],
      ),
    );
  }
  
}

class _buttom_bar extends StatelessWidget{
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
              //add employee to table
              // GestureDetector(
              //   child: const CircleAvatar(
              //     backgroundColor: Colors.white,
              //     radius: 20,
              //     child: Icon(Icons.add_chart,size: 25,color:Color(0xff005194),),
              //   ),
              //   onTap: ()=>_Draw_add_user_dialog(),
              // ),

              // show day's employee
              // GestureDetector(
              //   child:  const CircleAvatar(
              //     backgroundColor: Colors.white,
              //     radius: 20,
              //     child: Icon(Icons.remove_red_eye,size:25,color: Color(0xff005194),),
              //   ),
              //   onTap: ()=>_Draw_day_users_dialog(),
              // ),

              //show all employs on department
              GestureDetector (
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Icon(Icons.supervisor_account,size: 25,color: Color(0xff005194),),
                ),
                onTap: ()=> Get.to(Department_users()),
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

  // _Draw_day_users_dialog(){
  //   return Get.defaultDialog(title:"1"+" : المستخدمين فى يوم" ,
  //       content: Container(
  //         height: 400,
  //         width: 300,
  //         child: ListView.builder(
  //             itemCount: 4,
  //             itemBuilder: (context,index){
  //               return ListTile(
  //                 title: Text("user_name",style: TextStyle(color:Color(0xff005194),fontSize: 25 ),),
  //                 subtitle: Text("shift_type_name",style: TextStyle(color:Color(0xff005194) ),),
  //               );
  //             }),
  //       )
  //   );
  // }

  // _Draw_add_user_dialog(){
  //   return Get.defaultDialog(
  //     title:"1"+" : اضافه مستخدم ليوم" ,
  //     content: Column(
  //
  //     )
  //   );
  // }

}

class _Gridview extends StatelessWidget{

  Shift_controller _shift_controller;
  int month_index;
  _Gridview(this._shift_controller,this.month_index);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _shift_controller.get_month_lastDay(month_index)>28?Get.height-310:Get.height-370,
      width: Get.width,
      padding: EdgeInsets.only(right: 10,left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.blue.shade200,width: 18)
      ),
      child: Obx(()=>_shift_controller.wait.value?CircularProgressIndicator():
      GridView.builder(
          itemCount:_shift_controller.get_month_lastDay(month_index)+7 ,
          controller: ScrollController(initialScrollOffset: 0),
          scrollDirection: Axis.vertical ,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio:.8,
            crossAxisSpacing:8,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context,index){
            return _draw_list_item(index+1,_shift_controller,month_index);
          })),
    ).frosted(blur: 1,frostColor: Colors.white,borderRadius: BorderRadius.circular(20) );
  }



}

class _draw_list_item extends StatelessWidget{
  Shift_controller _shift_controller;

   int day_index ;
  int month_index ;
  _draw_list_item(this.day_index,this._shift_controller,this.month_index);

  @override
  Widget build(BuildContext context) {
    return  day_index <=7?
         Center(child: Text(_shift_controller.get_day_name(day_index,month_index),style: TextStyle(fontSize:20,color: Colors.blue[600],fontWeight: FontWeight.bold)))
        :GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.red,width:_shift_controller.now.day== day_index-7&&month_index==0?6:0),
            //(check user & day)
            color: _shift_controller.day_color(day_index-7,month_index)
        ),
        child: Center(child: Text((day_index-7).toString(),style: TextStyle(fontSize:25,
            color:_shift_controller.get_day_num(day_index-7,month_index)==5||_shift_controller.get_day_num(day_index-7,month_index)==6? Colors.white38:Colors.white,
            fontWeight: FontWeight.bold))),
      ),
      onTap: (){
           Get.to(Shift_users(_shift_controller.get_year_month_day(day_index-7,month_index) ));
      },
    );
  }



}

class _color_description extends StatelessWidget{
  Shift_controller controller;
  _color_description(this.controller);

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
                  _Draw_item(Colors.blue.shade600, "ليس لديك شيفت"),//not manger
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