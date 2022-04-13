import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shieft/controller/signin_controller.dart';
import 'package:shieft/model/shift_model.dart';
import 'package:shieft/repository/shift_repo/shift_repo.dart';




class Shift_controller extends GetxController{

  var now = new DateTime.now();
  Shift_repo ?shift_repo;
  RxList<Shift_model> shift_list = [Shift_model()].obs;
  Signin_controller _signin_controller = Get.find();
  RxBool wait =false.obs;
  bool ?is_manger ;


  @override
  void onInit() {
    is_manger = _signin_controller.model!.role=='manger';
  }

  String get_day_name(int day_index,int month_index){

    switch(get_day_num(day_index,month_index)) {
      case 1: return "Mon";
      case 2: return "Tu";
      case 3: return "Wen";
      case 4: return "Tha";
      case 5: return "Fri";
      case 6: return "Sat";
      case 7: return "Sun";
    }
    return"";
  }

  int get_day_num(int day_index,int month_index){
    var month = now.month+month_index;
    return DateTime(now.year, month , day_index).weekday;
  }

  int get_month_lastDay(int index){
    var month = now.month+index;
    var lastDayDateTime = (month < 12) ?  DateTime(now.year, month + 1, 0) :  DateTime(now.year + 1, 1, 0);
    return lastDayDateTime.day;
  }


  get_shift_details_in_month()async{
    wait.value = true;
    //----first month data------
    var date = get_year_month_day(1, 0); // don't care about day
    shift_list.value = await shift_repo!.get_shift_details_in_month(date[1]+'-'+date[0]); //month - year
    //-----second month data-----
    date = get_year_month_day(1, 1); // don't care about day
    shift_list.value.addAll(await shift_repo!.get_shift_details_in_month(date[1]+'-'+date[0])); //month - year
    wait.value = false;
  }

  get_year_month_day(int day,int month_index){
    int year = DateTime.now().year;
    int month = DateTime.now().month+month_index;
    if(month>12){
      year++;
      month=1;
    }
    var year_month_day = DateTime(year,month,day).toString().substring(0,10);//(ex) 2022-10-05
    
    return year_month_day.toString().split('-');  // 05-09-2022
  }

  Color day_color(int day,int month_index){

    var date = get_year_month_day(day, month_index);

    bool user_have_work = _check_user_day(date[2],date[1]);
    bool day_have_users = _check_admin_day(date[2],date[1]);

      if(user_have_work){
        return Colors.green; //  have work  (user)
      }else{
        if(is_manger!){
          if(day_have_users){
            return Colors.blue.shade600; //manger & have employee & have work
          }else{
            return Colors.grey; // manger & not have employee & have work
          }
        }else {
          return Colors.blue.shade600;
        }// not manger & not today (user)
      }
  }

  bool _check_user_day(String day,String month){
    for(int i=0;i<shift_list.value.length;i++){
      if(day+'-'+month == shift_list.value[i].date!.substring(0,5)){
        if(_signin_controller.model!.userId == shift_list.value[i].userId )
          return true;
      }
    }
    return false;
  }

  bool _check_admin_day(String day,String month){
    for(int i=0;i<shift_list.value.length;i++){
      if(day+'-'+month == shift_list.value[i].date!.substring(0,5)){
          return true;
      }
    }
    return false;
  }

}