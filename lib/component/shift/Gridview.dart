import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/shift_controller.dart';
import '../../view/employees/shift_users.dart';

class Gridview extends StatelessWidget{

  Shift_controller _shift_controller;
  int month_index;
  late String month;
  Gridview(this._shift_controller,this.month_index){
    month = (DateTime.now().month+month_index).toString();
    if(month=='13')
      month='1';

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(month+' شهر ',style: TextStyle(fontSize: 20,color:Color(0xff005194),
            fontWeight: FontWeight.bold),),
        Container(
          height: _shift_controller.get_month_lastDay(month_index)>28?Get.height-280:Get.height-330,
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
              //physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio:.8,
                crossAxisSpacing:8,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context,index){
                return _draw_list_item(index+1,_shift_controller,month_index);
              })),
        ),
      ],
    );//.frosted(blur: 1,frostColor: Colors.white,borderRadius: BorderRadius.circular(20) );
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
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color:month_index==0&&_shift_controller.now.day== day_index-7? Colors.red:Colors.white,width:2),
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