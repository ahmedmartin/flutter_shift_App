import 'package:shieft/model/signin_model.dart';
import 'package:shieft/model/user_bydepartment_model.dart';
import 'package:shieft/model/user_details_model.dart';
import 'package:shieft/repository/user_repo/user_repo.dart';



class User_repo_test extends User_repo {

  @override
  Future<dynamic> login(String email, String pass) async{
    if(email.isNotEmpty&&pass.isNotEmpty){
      if(email=="admin@mcit.com"&&pass=="123456") {
        return Signin_model.fromJson({
          "UserId": 5,
          "UserName": "admin",
          "Email": "admin@mcit.com",
          "Telephone": "0117474747",
          "EntryTelephone": "4773",
          "EmployeeNumber": "8838",
          "Depart": "department",
          "Role": "admin",
          "Token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJNdWhhbW1lZEFQSUFjY2Vzc1Rva2VuIiwianRpIjoiYTJiOTNhZmEtYjc3Mi00ZmVmLTljMjAtNDBlNWMzMjVmYTdhIiwiaWF0IjoiMDMtQXByLTIyIDc6NTM6NDYgQU0iLCJpZCI6IjUiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJhZG1pbiIsIlVzZXJOYW1lIjoiYWRtaW4iLCJFbWFpbCI6ImFkbWluQG1jaXQuY29tIiwiZXhwIjoxNjQ5MDU4ODI2LCJpc3MiOiJNdWhhbW1lZEFQSVNlcnZpY2UiLCJhdWQiOiJNdWhhbW1lZEFQSUNsaWVudCJ9.2xrf4UohOkf0eYshE-WsXGR3pYS8kjGqvr39fx2kiTc"
        });
      }else if(email=="manger@mcit.com"&&pass=="123456"){
        return Signin_model.fromJson({
          "UserName": "manger",
          "Email": "manger@mcit.com",
          "DeptId": 3,
          "Telephone": "012840559",
          "EntryTelephone": "4858",
          "EmployeeNumber": "49038",
          "UserId": 6,
          "Role": "manger",
          "Department": "depart",
          "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJNdWhhbW1lZEFQSUFjY2Vzc1Rva2VuIiwianRpIjoiNWM2NGVmODgtODc3OC00ZTc4LTk4YTEtNmQ0Y2FjN2M5ZTdhIiwiaWF0IjoiMDUtQXByLTIyIDg6NTM6MTkgQU0iLCJpZCI6IjYiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJtYW5nZXIiLCJVc2VyTmFtZSI6Im1hbmdlciIsIkVtYWlsIjoibWFuZ2VyQG1jaXQuY29tIiwiZXhwIjoxNjQ5MjM1MTk5LCJpc3MiOiJNdWhhbW1lZEFQSVNlcnZpY2UiLCJhdWQiOiJNdWhhbW1lZEFQSUNsaWVudCJ9.HEycEXt8zQPpKm0Cd8V72TFvqDOYDj1632K_2kC8GUE"
        });
      }else if(email=="user@mcit.com"&&pass=="123456"){
        return Signin_model.fromJson({
          "UserName": "user",
          "Email": "user@mcit.com",
          "DeptId": 3,
          "Telephone": "010474833",
          "EntryTelephone": "9364",
          "EmployeeNumber": "2845",
          "UserId": 7,
          "Role": "user",
          "Department": "depart",
          "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJNdWhhbW1lZEFQSUFjY2Vzc1Rva2VuIiwianRpIjoiYjdjMzU1MDctYTY0YS00MzU3LWJiZDAtMzY2ZmZhOTQ0NmRmIiwiaWF0IjoiMDUtQXByLTIyIDc6Mjg6MzMgQU0iLCJpZCI6IjciLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJ1c2VyIiwiVXNlck5hbWUiOiJ1c2VyIiwiRW1haWwiOiJ1c2VyQG1jaXQuY29tIiwiZXhwIjoxNjQ5MjMwMTEzLCJpc3MiOiJNdWhhbW1lZEFQSVNlcnZpY2UiLCJhdWQiOiJNdWhhbW1lZEFQSUNsaWVudCJ9.33f_sqz4Tl2bH9N-HvrX5FadF6fjr8dLIgVE9NSnyoY"
        });
      }
    }else{
      return  "Invalid email and password";
    }
  }

  @override
  Future<List<User_bydepartment_model>> get_users_bydepartment(int dep) async{
    List<dynamic> list =[
      {
        "UserName": "manger",
        "Email": "manger@mcit.com",
        "DeptId": 3,
        "Telephone": "012840559",
        "EntryTelephone": "4858",
        "EmployeeNumber": "49038",
        "UserId": 6,
        "RoleId": 3
      },
      {
        "UserName": "user",
        "Email": "user@mcit.com",
        "DeptId": 3,
        "Telephone": "010474833",
        "EntryTelephone": "9364",
        "EmployeeNumber": "2845",
        "UserId": 7,
        "RoleId": 4
      },
      {
        "UserName": "employee",
        "Email": "employee@mcit.com",
        "DeptId": 3,
        "Telephone": "0123234344",
        "EntryTelephone": "747474",
        "EmployeeNumber": "4747",
        "UserId": 1004,
        "RoleId": 3
      }
    ];
    List<User_bydepartment_model> user_model = [];
    list.forEach((element) => user_model.add(User_bydepartment_model.fromJson(element)));
    return user_model;
  }

  @override
  Future<User_details_model> get_users_byid(int id) async{
    return User_details_model.fromJson({
      "UserName": "manger",
      "Email": "manger@mcit.com",
      "DeptId": 3,
      "Telephone": "012840559",
      "EntryTelephone": "4858",
      "EmployeeNumber": "49038",
      "UserId": 6,
      "RoleId": 3,
      "Role_name": "manger",
      "Dep_name": "depart"
    });
  }

}