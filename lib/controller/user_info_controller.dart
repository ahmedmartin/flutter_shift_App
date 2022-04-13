import 'package:get/get.dart';
import 'package:shieft/controller/signin_controller.dart';
import 'package:shieft/model/user_details_model.dart';
import 'package:shieft/repository/user_repo/user_repo.dart';



class User_info_controller extends GetxController with StateMixin<User_details_model>{

  late User_repo user_repo;
  Signin_controller _signin_controller = Get.find();




  get_user(){
    user_repo.get_users_byid(_signin_controller.model!.userId!).
    then((value) => change(value, status: RxStatus.success()));
  }


}