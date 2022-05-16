import 'package:shieft/model/users_model.dart';
import 'package:shieft/model/user_details_model.dart';




abstract class User_repo {
  Future<List<users_model>> get_users_bydepartment(int dep);
  Future <dynamic> login(String email, String pass);
  Future<User_details_model> get_users_byid(int id);
  Future<List<users_model>> get_manger_users(int manger_id);
  Future<dynamic> add_user(String user_name,String email,String pass,
      String telephone,String entry_telephone,int dep_id,String employee_num);
  Future<String> change_pass(String new_pass,User_details_model model);

}