import 'package:get/get.dart';
import 'package:shieft/model/signin_model.dart';
import 'package:shieft/repository/signin_repo.dart';




class Signin_controller extends GetxController{

  RxBool wait =false.obs;
  RxBool show_pass = true.obs;

  Signin_model ?model;

  signin (String email, String pass) async{

    wait.value= true;
    model = await Signin_repo().get_user( email,  pass);
    wait.value=false;
    print(model);

  }


}