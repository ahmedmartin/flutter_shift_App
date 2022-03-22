import 'package:get/get.dart';
import 'package:shieft/model/signin_model.dart';



class Signin_repo extends GetConnect{

  String route = "https://localhost:44344/api";

  Future <Signin_model> get_user(String email, String pass)async{
    final response = await post('$route/Signin',{
      "username":email,
      "password":pass
    });

    if(response.status.hasError){
      print(response.statusText!);
      return Signin_model();
    }
    return Signin_model.fromJson(response.body);
  }

}