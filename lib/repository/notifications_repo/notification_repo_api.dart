import 'package:get/get.dart';
import 'package:shieft/repository/notifications_repo/notification_repo.dart';



class Notification_repo_api extends GetConnect with Notification_repo{

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
      // final response = await Dio().post(
      //     'https://fcm.googleapis.com/fcm/send', data: body
      //     , options: Options(headers: {'Authorization': server_key}));
      final response = await post('https://fcm.googleapis.com/fcm/send',body,headers:{'Authorization': server_key} );
      if (response.statusCode == 200) {
        return 'تم الارسال بنجاح';
      }
      //print(response.statusCode);
      return response.statusText!;
      // return response.statusMessage!;
    }catch(e){
      return 'تأكد من الاتصال بالانترنت و حاول مره اخرى';
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
      // final response = await Dio().post(
      //     'https://fcm.googleapis.com/fcm/send', data: body
      //     , options: Options(headers: {'Authorization': server_key}));
      final response = await post('https://fcm.googleapis.com/fcm/send',body,headers:{'Authorization': server_key} );
      if (response.statusCode == 200) {
        return 'تم الارسال بنجاح';
      }
      //print(response.statusCode);
      return response.statusText!;
      //return response.statusMessage!;
    }catch(e){
      return 'تأكد من الاتصال بالانترنت و حاول مره اخرى';
    }
  }

}