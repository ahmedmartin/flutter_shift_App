import 'package:get/get.dart';
import 'package:shieft/controller/signin_controller.dart';
import 'package:shieft/model/user_bydepartment_model.dart';
import 'package:shieft/repository/user_repo/user_repo.dart';


class Department_users_controller extends GetxController with StateMixin<List<User_bydepartment_model>>{

  late User_repo user_repo;
  Signin_controller _signin_controller = Get.find();
  late User_bydepartment_model user_model;

  bool is_manger(){
    return _signin_controller.model!.role=='manger';
  }

  get_users_byDepartment() async {
    await user_repo.get_users_bydepartment(_signin_controller.model!.deptId!).
    then((value) => change(value, status: RxStatus.success()));

  }

}