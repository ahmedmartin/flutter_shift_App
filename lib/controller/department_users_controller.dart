import 'package:get/get.dart';
import 'package:shieft/controller/signin_controller.dart';
import 'package:shieft/model/users_model.dart';
import 'package:shieft/repository/user_repo/user_repo.dart';


class Department_users_controller extends GetxController with StateMixin<List<users_model>>{

  late User_repo user_repo;
  Signin_controller _signin_controller = Get.find();
  late users_model user_model;

  bool is_manger(){
    return _signin_controller.model!.role=='manger';
  }

  get_users_byDepartment() async {
    if(is_manger()){
      await user_repo.get_manger_users(_signin_controller.model!.userId!).
      then((value) => change(value, status: RxStatus.success()));
    }else {
      await user_repo.get_users_bydepartment(_signin_controller.model!.deptId!).
      then((value) => change(value, status: RxStatus.success()));
    }

  }

}