import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shieft/controller/shift_users_count_controller.dart';

class Draw_dropdown_months extends StatefulWidget{
  Shift_users_count_controller controller;
  String hint;
  Draw_dropdown_months(this.hint,this.controller);
  @override
  State<StatefulWidget> createState() {
    return _Draw_dropdown_months(hint, controller);
  }

}

class _Draw_dropdown_months extends State<Draw_dropdown_months>{

  Shift_users_count_controller controller;
  DateTime date = DateTime(DateTime.now().year,DateTime.now().month);
  List<String> months = [];
  String hint;

  _Draw_dropdown_months(this.hint,this.controller){
    months = ['${date.month.toString().padLeft(2,'0')}-${date.year.toString()}',
      '${date.add(Duration(days: 31)).month.toString().padLeft(2,'0')}-${date.add(Duration(days: 31)).year.toString()}'];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: months.map((val)=>DropdownMenuItem(
          child:Text(val),value: val)).toList(),
      hint: Text(hint,style: TextStyle(color:Color(0xff005194),fontSize: 20,
          fontWeight: FontWeight.bold),textAlign: TextAlign.center,) ,
      value: controller.date ,
      icon: const Icon(Icons.arrow_drop_down,color:Color(0xff005194),),
      style: const TextStyle(color:Color(0xff005194),
          fontWeight: FontWeight.w900),
      onChanged: (val){
        controller.date = (val as String);
        setState(() {});
        controller.get_users_count();
      },
    );
  }
}