import 'package:shieft/model/shift_model.dart';
import 'package:shieft/model/shift_type_model.dart';
import 'package:shieft/repository/shift_repo/shift_repo.dart';

class Shift_repo_test extends Shift_repo{


  @override
  Future<List<Shift_model>> get_shift_details_in_month(String month_year) async{
    if(month_year!=null){
      List<dynamic> list = [
      {
        "shiftId": 3,
        "date": "05-04-2022",
        "userId": 6,
        "userName": "test",
        "adminId": 6,
        "adminName": "manger",
        "shiftName": "on call",
        "time": "21:11:11"
      },
      {
    "shiftId": 1002,
    "date": "14-04-2022",
    "userId": 7,
    "userName": "employee",
    "adminId": 6,
    "adminName": "manger",
    "shiftName": "on call",
    "time": "11:11:11"
    },
    {
    "shiftId": 1003,
    "date": "12-04-2022",
    "userId": 1004,
    "userName": "employee",
    "adminId": 5,
    "adminName": "admin",
    "shiftName": "on call",
    "time": "11:11:11"
    },
        {
          "shiftId": 1003,
          "date": "25-05-2022",
          "userId": 6,
          "userName": "employee",
          "adminId": 5,
          "adminName": "admin",
          "shiftName": "on call",
          "time": "11:11:11"
        },
        {
          "shiftId": 1002,
          "date": "02-05-2022",
          "userId": 7,
          "userName": "employee",
          "adminId": 6,
          "adminName": "manger",
          "shiftName": "on call",
          "time": "11:11:11"
        },
        {
          "shiftId": 3,
          "date": "17-05-2022",
          "userId": 7,
          "userName": "test",
          "adminId": 6,
          "adminName": "manger",
          "shiftName": "on call",
          "time": "21:11:11"
        },
        {
          "shiftId": 3,
          "date": "24-04-2022",
          "userId": 1004,
          "userName": "test",
          "adminId": 6,
          "adminName": "manger",
          "shiftName": "on call",
          "time": "21:11:11"
        },
        {
          "shiftId": 3,
          "date": "11-05-2022",
          "userId": 7,
          "userName": "test",
          "adminId": 6,
          "adminName": "manger",
          "shiftName": "on call",
          "time": "21:11:11"
        }
    ];
      List<Shift_model> shift_model = [];
      list.forEach((element) => shift_model.add(Shift_model.fromJson(element)));
      return shift_model;
    }

    return [];
  }

  @override
  Future<List<Shift_model>> get_shift_details_in_day(String day_month_year) async{
    if(day_month_year!=null){
      List<dynamic> list = [
        {
          "shiftId": 3,
          "date": "10-10-2022",
          "userId": 7,
          "userName": "user",
          "adminId": 6,
          "adminName": "manger",
          "shiftName": "on call",
          "depName": "depart"
        },
        {
          "shiftId": 1002,
          "date": "10-10-2022",
          "userId": 5,
          "userName": "employee",
          "adminId": 6,
          "adminName": "manger",
          "shiftName": "on call",
          "depName": "dep"
        },
        {
          "shiftId": 1003,
          "date": "10-10-2022",
          "userId": 1003,
          "userName": "emp",
          "adminId": 5,
          "adminName": "admin",
          "shiftName": "on call",
          "depName": "department"
        },
        {
          "shiftId": 1003,
          "date": "10-10-2022",
          "userId": 1000,
          "userName": "person",
          "adminId": 5,
          "adminName": "admin",
          "shiftName": "on call",
          "depName": "department1"
        },
        {
          "shiftId": 1002,
          "date": "10-10-2022",
          "userId": 1005,
          "userName": "per",
          "adminId": 6,
          "adminName": "manger",
          "shiftName": "on call",
          "depName": "depart"
        },
        {
          "shiftId": 3,
          "date": "10-10-2022",
          "userId": 7,
          "userName": "test",
          "adminId": 6,
          "adminName": "manger",
          "shiftName": "on call",
          "depName": "depart2"
        }
      ];
      List<Shift_model> shift_model = [];
      list.forEach((element) => shift_model.add(Shift_model.fromJson(element)));
      return shift_model;
    }

    return [];
  }

  @override
  Future<String> add_shift(date, time, shift_type_id, user_id, admin_id) async{
    if(date.isNotEmpty&&time.isNotEmpty&&shift_type_id!=null&&user_id!=null&&admin_id!=null){
      return "User Added to Shift Date $date";
    }
    return "Complete Input Data ";
  }

  @override
  Future<List<Shift_type_model>> get_shift_type() async{
    List<dynamic> list =[
      {
        "shiftTypeId": 4,
        "shiftName": "on call"
      },
      {
        "shiftTypeId": 5,
        "shiftName": "on home"
      },
      {
        "shiftTypeId": 6,
        "shiftName": "on here"
      }
    ];
    List<Shift_type_model> shift_type_model = [];
    list.forEach((element) => shift_type_model.add(Shift_type_model.fromJson(element)));
    return shift_type_model;
  }

}