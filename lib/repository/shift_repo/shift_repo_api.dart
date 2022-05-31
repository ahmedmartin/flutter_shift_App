import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shieft/model/shift_model.dart';
import 'package:shieft/model/shift_type_model.dart';
import 'package:shieft/model/user_count_model.dart';
import 'package:shieft/repository/shift_repo/shift_repo.dart';



class Shift_repo_api extends GetConnect with Shift_repo{

  String url = 'https://shifts.mcit.gov.eg/api'; //stage link
  //String url = 'http://10.0.2.2:8000/api';  //local link

  @override
  Future<String> add_shift(String date, int shift_type_id, int user_id, int admin_id) async {
    var body = {
      "date": date,
      "userId": user_id,
      "adminId": admin_id,
      "shiftTypeId": shift_type_id
    };
    try {
      final response = await Dio().post('${url}/Shiefts', data: body);
      if (response.statusCode == 200)
        return 'تم الاضافه بنجاح';

      return response.statusMessage!;
    }catch (e) {
      return e.toString();
    }
  }

  @override
  Future<List<Shift_model>> get_shift_details_in_day(String day_month_year) async {
    // final response = await get('${url}/Shiefts/shift_details_inDay?day_month_year=${day_month_year}');
    final response = await Dio().get('${url}/Shiefts/shift_details_inDay?day_month_year=${day_month_year}');
    List<Shift_model> shift_model = [];
    if(response.statusCode==200)
      response.data.forEach((element) => shift_model.add(Shift_model.fromJson(element)));

    return shift_model;
  }

  @override
  Future<List<Shift_model>> get_shift_details_in_month(String month_year) async {
    // final response = await get('${url}/Shiefts/shift_details_inMonth?month_year=${month_year}');
    final response = await Dio().get('${url}/Shiefts/shift_details_inMonth?month_year=${month_year}');
    List<Shift_model> shift_model = [];
    if(response.statusCode==200)
       response.data.forEach((element) => shift_model.add(Shift_model.fromJson(element)));

    return shift_model;
  }

  @override
  Future<List<Shift_type_model>> get_shift_type() async {
    // final response = await get('${url}/ShiftTypes');
    final response = await Dio().get('${url}/ShiftTypes');
    List<Shift_type_model> shift_model = [];

    if(response.statusCode==200)
      response.data.forEach((element) => shift_model.add(Shift_type_model.fromJson(element)));

    return shift_model;
  }

  @override
  Future<List<User_count_model>> get_users_shift_count__bymonth(String month_year, int manger_id) async {
    final response = await Dio().get('${url}/Shiefts/users_shift_count__bymonth?month_year=${month_year}&manger_id=${manger_id}');
    List<User_count_model> shift_model = [];

    if(response.statusCode==200)
      response.data.forEach((element) => shift_model.add(User_count_model.fromJson(element)));

    return shift_model;
  }

  @override
  Future<String> edit_shift(int shift_id, String date, int shift_type_id, int user_id, int admin_id) async {
    var body = {
      "shiftId": shift_id,
      "date": date,
      "userId": user_id,
      "adminId": admin_id,
      "shiftTypeId": shift_type_id
    };
    final response = await Dio().put('${url}/Shiefts',data: body);
    if(response.statusCode==200)
      return 'تم التعديل بنجاح';

    return response.statusMessage!;
  }

  @override
  Future<String> notification_multiple_departments(String noti_title, String noti_body,String noti_image,String topics) async{

    String server_key = 'key=AAAA6GQ1sxA:APA91bH74os9vtIAy7CGs4UseQ3OrUPgK6djs6uWCH6foyaz764Y8ydE9rTaxa1LASBZwaKizAUtk1vQvXK8K1fOiT-u6ND10CHezmTfnXgf_4y2_nO896hLgk-NtLW_SWnh0zNUGMXn';

    Map<String,dynamic> body = {
      "condition" : topics,//"'$topics' in topics",
      "notification" : {
        "body" : noti_body,
        "title": noti_title,
        "image": noti_image,
        "sound":"default"
      },
      "data" : {
        "body" : 'data_body',
        "title": 'data_title',
        "image":'selected_imge.value'

      }
    };
    try {
      final response = await Dio().post(
          'https://fcm.googleapis.com/fcm/send', data: body
          , options: Options(headers: {'Authorization': server_key}));
      if (response.statusCode == 200) {
        return 'تم الارسال بنجاح';
      }
      print(response.statusCode);

      return response.statusMessage!;
    }catch(e){
      print(e.toString());
      return e.toString();
    }
  }


  @override
  Future<String> notification_special_department(String noti_title, String noti_body,String noti_image,String topic) async{

    String server_key = 'key=AAAA6GQ1sxA:APA91bH74os9vtIAy7CGs4UseQ3OrUPgK6djs6uWCH6foyaz764Y8ydE9rTaxa1LASBZwaKizAUtk1vQvXK8K1fOiT-u6ND10CHezmTfnXgf_4y2_nO896hLgk-NtLW_SWnh0zNUGMXn';

    Map<String,dynamic> body = {
      "condition" : "'$topic' in topics",
      "notification" : {
        "body" : noti_body,
        "title": noti_title,
        "image": noti_image,
        "sound":"default"
      },
      "data" : {
        "body" : 'data_body',
        "title": 'data_title',
        "image":'selected_imge.value'

      }
    };
    try {
      final response = await Dio().post(
          'https://fcm.googleapis.com/fcm/send', data: body
          , options: Options(headers: {'Authorization': server_key}));
      if (response.statusCode == 200) {
        return 'تم الارسال بنجاح';
      }
      print(response.statusCode);

      return response.statusMessage!;
    }catch(e){
      print(e.toString());
      return e.toString();
    }
  }

}