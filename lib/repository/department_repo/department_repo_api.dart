



import 'package:dio/dio.dart';
import 'package:shieft/model/department_model.dart';
import 'package:shieft/repository/department_repo/department_repo.dart';

class Department_repo_api extends Department_repo{

  String url = 'https://shifts.mcit.gov.eg/api'; //stage link
  //String url = 'http://10.0.2.2:8000/api';  //local link

  @override
  Future<List<Department_model>> get_departments() async {
    final response = await Dio().get('${url}/Departments');
    List<Department_model> shift_model = [];
    if(response.statusCode==200)
      response.data.forEach((element) => shift_model.add(Department_model.fromJson(element)));

    return shift_model;
  }

  @override
  Future<List<Department_model>> get_manger_departments(int manger_id) async {
    // final response = await Dio().get('${url}/Departments/manger_departments/${manger_id}');
    final response = await Dio().get('${url}/Departments/manger_departments/2010');
    List<Department_model> shift_model = [];
    if(response.statusCode==200)
      response.data.forEach((element) => shift_model.add(Department_model.fromJson(element)));

    return shift_model;
  }

}