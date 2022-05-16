


import 'package:shieft/model/department_model.dart';
import 'package:shieft/repository/department_repo/department_repo.dart';

class Department_repo_test extends Department_repo{

  @override
  Future<List<Department_model>> get_departments() async {
    //----------api/Departments
    List<dynamic> list =[
      {
        "depId": 1,
        "depName": "department",
        "mangerId": 1004
      },
      {
        "depId": 3,
        "depName": "depart",
        "mangerId": 6
      },
      {
        "depId": 4,
        "depName": "department1",
        "mangerId": 1005
      },
      {
        "depId": 1002,
        "depName": "string",
        "mangerId": 5
      }
    ];
    List<Department_model> depart_model = [];
    list.forEach((element) => depart_model.add(Department_model.fromJson(element)));
    return depart_model;
  }

  @override
  Future<List<Department_model>> get_manger_departments(int manger_id) async{
    //-----------api/Departments/manger_departments/6

    List<dynamic> list =[
      {
        "depId": 1,
        "depName": "department",
        "mangerId": 6
      },
      {
        "depId": 3,
        "depName": "depart",
        "mangerId": 6
      },
      {
        "depId": 4,
        "depName": "department1",
        "mangerId": 6
      },
      {
        "depId": 1002,
        "depName": "string",
        "mangerId": 6
      }
    ];
    List<Department_model> depart_model = [];
    list.forEach((element) => depart_model.add(Department_model.fromJson(element)));
    return depart_model;
  }



}