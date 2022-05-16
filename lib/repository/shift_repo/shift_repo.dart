
import 'package:shieft/model/shift_model.dart';
import 'package:shieft/model/shift_type_model.dart';
import 'package:shieft/model/user_count_model.dart';


abstract class Shift_repo {

  Future<List<Shift_model>> get_shift_details_in_month(String month_year);

  Future<List<Shift_model>> get_shift_details_in_day(String day_month_year);

  Future<List<Shift_type_model>> get_shift_type();

  Future<String> add_shift(String date,int shift_type_id,int user_id,int admin_id);

  Future<List<User_count_model>> get_users_shift_count__bymonth(String month_year,int manger_id);

  Future<String> edit_shift(int shift_id,String date,int shift_type_id,int user_id,int admin_id);

}