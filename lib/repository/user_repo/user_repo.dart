import 'package:shieft/model/user_bydepartment_model.dart';
import 'package:shieft/model/user_details_model.dart';




abstract class User_repo {
  Future<List<User_bydepartment_model>> get_users_bydepartment(int dep);
  Future <dynamic> login(String email, String pass);
  Future<User_details_model> get_users_byid(int id);
}