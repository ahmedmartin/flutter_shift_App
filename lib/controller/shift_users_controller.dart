import 'package:get/get.dart';
import 'package:shieft/controller/signin_controller.dart';
import 'package:shieft/model/department_model.dart';
import 'package:shieft/model/shift_model.dart';
import 'package:shieft/model/shift_type_model.dart';
import 'package:shieft/model/user_bydepartment_model.dart';
import 'package:shieft/model/user_details_model.dart';
import 'package:shieft/repository/department_repo/department_repo.dart';
import 'package:shieft/repository/shift_repo/shift_repo.dart';
import 'package:shieft/repository/user_repo/user_repo.dart';




class Shift_users_controller extends GetxController  {

  late User_repo user_repo;
  late Shift_repo shift_repo;
  late Department_repo dep_repo;
  RxList <Shift_model>search_list =[Shift_model()].obs;
  List <User_bydepartment_model>users_list =[];
  RxBool wait =false.obs;
  RxString time ="Select Time".obs;
  late List <Shift_model>shifts_details_list ;
  late String date ;
  Signin_controller _signin_controller = Get.find();
  late bool is_manger ;
  late String msg;
  late User_details_model user_details_model;
  //------drop down button----
  RxList <User_bydepartment_model>dropdwon_users_list =[User_bydepartment_model()].obs;
  RxList <Shift_type_model>shift_type_list =[Shift_type_model()].obs;
  RxList <Department_model>department_list =[Department_model()].obs;
  User_bydepartment_model ?user_model;
  RxInt user_id=0.obs;
  Shift_type_model ?shift_type_model;
  RxInt shift_type_id=0.obs;
  Department_model ?department_model;
  RxInt department_id=0.obs;
  //---------------------------


  Shift_users_controller(){
    //date = '$day-${DateTime.now().month+month_index}-${DateTime.now().year}';
    is_manger = _signin_controller.model!.role=='manger';
  }

  get_shifts_in_day()async{
    // if(day<10){
    //   date = '0$day-${DateTime.now().month+month_index}-${DateTime.now().year}'; //05-11-2022 (ex)
    // }
    wait.value = true;
    shifts_details_list = await shift_repo.get_shift_details_in_day("10-10-2022");//date
    search_list.value.clear();
    search_list.value.addAll(shifts_details_list);
    wait.value = false;
  }

  get_shift_type()async{
   shift_type_list.value = await shift_repo.get_shift_type();
  }

  get_department()async{
    department_list.value = await dep_repo.get_departments();
  }

  get_users_bydepartment()async{
    dropdwon_users_list.value.clear();
    user_id.value=0;
    users_list = await user_repo.get_users_bydepartment(department_id.value);


    dropdwon_users_list.value.addAll(users_list.where((e1) => shifts_details_list.any((e2) => e2.userId==e1.userId)));
    //dropdwon_users_list.value.removeWhere((e1) => shifts_details_list.any((e2) => e2.userId==e1.userId));
    print(users_list);
  }

  get_userbyid(int id)async{
    user_details_model = await user_repo.get_users_byid(id);
  }

  add_shift()async{
    if(time.value=="Select Time"||shift_type_id.value==0||user_id.value==0){
      msg = "ادخل جميع البيانات بشكل صحيح";
    }else {
      msg = await shift_repo.add_shift(date, time.value, shift_type_id.value, user_id.value, _signin_controller.model!.userId!);
    }
  }

  search_in_shifts(String user_name){
    search_list.clear();
    if(user_name.isEmpty){
      search_list.value.addAll(shifts_details_list);
    }else{
      search_list.value.addAll(shifts_details_list.where((element) =>
          element.userName!.contains(user_name) ||element.depName!.contains(user_name)));
    }
  }

  @override
  void dispose() {
    Get.delete<Shift_users_controller>();
  }
}