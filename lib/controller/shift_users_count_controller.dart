import 'package:get/get.dart';
import 'package:shieft/controller/signin_controller.dart';
import 'package:shieft/model/user_count_model.dart';
import 'package:shieft/repository/shift_repo/shift_repo.dart';

import '../model/department_model.dart';
import '../repository/department_repo/department_repo.dart';
import '../repository/notifications_repo/notification_repo.dart';





class Shift_users_count_controller extends GetxController with StateMixin<List<User_count_model>>{

 // RxList <User_count_model>users_list =[User_count_model()].obs;
  Signin_controller _signin_controller = Get.find();
  late Shift_repo shift_repo;
  late Department_repo dep_repo;
  late Notification_repo noti_repo;
  String date = DateTime.now().month.toString().padLeft(2,'0')+'-'+DateTime.now().year.toString();
  String msg='';
  List <Department_model>department_list =[Department_model()].obs;

  get_users_count() async {

    // date = DateTime.now().month.toString().padLeft(2,'0');
    // date = date! +'-'+DateTime.now().year.toString();
    await shift_repo.get_users_shift_count__bymonth(date,_signin_controller.model!.userId!).
     then((value) => change(value, status: RxStatus.success()));
  }

  get_manger_department()async{

    department_list = await dep_repo.get_manger_departments(_signin_controller.model!.userId!);
  }

  push_notification() async {
    String departments_topics='';//"'dep_id1' in topics || 'dep_id2' in topics"
    int temp =0;
    department_list.forEach((element) {
      departments_topics+=" '${element.depId}' in topics ||";
      temp++;
      if(temp==5){
        departments_topics = departments_topics.substring(0,departments_topics.length-2);
        //departments_topics = '"'+departments_topics+'"';
        push_notification_from_api(departments_topics);
        temp=0;departments_topics='';
        print(departments_topics);
      }
    });
    if(temp != 0) {
      departments_topics =
          departments_topics.substring(0, departments_topics.length - 2);
     // departments_topics = '"'+departments_topics+'"';
      push_notification_from_api(departments_topics);
      //print(departments_topics);
    }


  }

  push_notification_from_api(String topics) async {
    msg = await noti_repo.notification_multiple_departments('نبطجيات شهر'+date,
        'تم تسكين نبطجيات الشهر ... انقر للمزيد',
        "https://www.learndash.com/wp-content/uploads/Notification-Add-on.png",
        topics);
  }


}