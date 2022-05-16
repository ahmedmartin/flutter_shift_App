import 'package:get/get.dart';
import 'package:shieft/controller/signin_controller.dart';
import 'package:shieft/model/user_count_model.dart';
import 'package:shieft/repository/shift_repo/shift_repo.dart';





class Shift_users_count_controller extends GetxController with StateMixin<List<User_count_model>>{

  RxList <User_count_model>users_list =[User_count_model()].obs;
  Signin_controller _signin_controller = Get.find();
  late Shift_repo shift_repo;
  late String date;

  get_users_count() async {

    date = DateTime.now().month.toString().padLeft(2,'0');
    date += '-'+DateTime.now().year.toString();
    await shift_repo.get_users_shift_count__bymonth(date,_signin_controller.model!.userId!).
     then((value) => change(value, status: RxStatus.success()));
  }


}