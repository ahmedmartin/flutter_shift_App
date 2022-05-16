import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:shieft/model/user_details_model.dart';
import 'package:shieft/model/users_model.dart';
import 'package:shieft/repository/user_repo/user_repo.dart';



class User_repo_api extends GetConnect with User_repo{

   String url = 'https://shifts.mcit.gov.eg/api'; //stage link
  //String url = 'http://10.0.2.2:8000/api';  //local link

  @override
  Future<List<users_model>> get_manger_users(int manger_id) async {
    final response = await Dio().get('${url}/Users/mangerUsers/${manger_id}');
    List<users_model> user_model = [];
    if(response.statusCode==200) {
      response.data.forEach((element) =>
          user_model.add(users_model.fromJson(element)));
    }
    return user_model;
  }

  @override
  Future<List<users_model>> get_users_bydepartment(int dep) async {
    final response = await Dio().get('${url}/Users/userbydepartment/${dep}');
    List<users_model> user_model = [];
    if(response.statusCode==200) {
      response.data.forEach((element) =>
          user_model.add(users_model.fromJson(element)));
    }
    return user_model;
  }

  @override
  Future<User_details_model> get_users_byid(int id) async {
    final response = await get('${url}/Users/${id}');
    User_details_model user_model = User_details_model();

    if(response.isOk)
       user_model = User_details_model.fromJson(response.body);

    return user_model;
  }

  @override
  Future login(String email, String pass) async {

  try {
    final response = await Dio().post("${url}/Signin", data: {"email": email,
      "password": pass
    });
    return response.data;
  }catch(e){
    return 'تاكد من بياناتك';
  }
  }

  @override
  Future add_user(String user_name, String email, String pass, String telephone, String entry_telephone, int dep_id, String employee_num) async {
    // always keep role is user (now user role = 4)
    var body= {
      "userName": user_name,
      "email": email,
      "deptId": dep_id,
      "telephone": telephone,
      "entryTelephone": entry_telephone,
      "employeeNumber": employee_num,
      "roleId": 4,
      "password": pass
    };
    try {
      final response = await Dio().post('${url}/Users', data: body);
      print(response.statusMessage);
      if (response.statusCode == HttpStatus.ok) {
        return users_model.fromJson(response.data);
      }else if(response.statusCode == HttpStatus.notFound){
        return response.data;
      }
    }catch(e){
      return 'هذا المستخدم موجود بالفعل';
    }
  }

  @override
  Future<String> change_pass(String new_pass,User_details_model model) async {

    var body= model.toJson();
    body['password']=new_pass;

      final response = await Dio().put('${url}/Users', data: body);
      print(response.statusMessage);
      if (response.statusCode == HttpStatus.ok) {
        return 'تم تغير الرقم السرى';
      }else {
        return response.statusMessage!;
      }
  }

}