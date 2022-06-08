import 'package:get/get.dart';
import 'package:shieft/controller/signin_controller.dart';
import 'package:shieft/model/department_model.dart';
import 'package:shieft/model/users_model.dart';
import 'package:shieft/model/shift_model.dart';
import 'package:shieft/model/shift_type_model.dart';
import 'package:shieft/model/user_details_model.dart';
import 'package:shieft/repository/department_repo/department_repo.dart';
import 'package:shieft/repository/shift_repo/shift_repo.dart';
import 'package:shieft/repository/user_repo/user_repo.dart';

import '../repository/notifications_repo/notification_repo.dart';




class Shift_users_controller extends GetxController  {

  late User_repo user_repo;
  late Shift_repo shift_repo;
  late Department_repo dep_repo;
  late Notification_repo noti_repo;
  RxList <Shift_model>search_list =[Shift_model()].obs;
  List <users_model>users_list =[];
  RxBool wait =false.obs;
  bool wait_add_or_update_or_remove_shift = false;
  late List <Shift_model>shifts_details_list ;
  late String date ;
  Signin_controller _signin_controller = Get.find();
  late bool is_manger ;
  late String msg;
  late User_details_model user_details_model;
  int updated_user_id = 0;
  int updated_shift_id = 0;
  //------drop down button----
  RxList <users_model>dropdwon_users_list =[users_model()].obs;
  RxList <Shift_type_model>shift_type_list =[Shift_type_model()].obs;
  RxList <Department_model>department_list =[Department_model()].obs;
  users_model ?user_model;
  RxInt user_id=0.obs;
  Shift_type_model ?shift_type_model;
  RxInt shift_type_id=0.obs;
  Department_model ?department_model;
  RxInt department_id=0.obs;
  //---------------------------


  Shift_users_controller(){
    is_manger = _signin_controller.model!.role=='manger';
  }

  get_shifts_in_day()async{

    wait.value = true;
    shifts_details_list = await shift_repo.get_shift_details_in_day(date);//date
    search_list.value.clear();
    search_list.value.addAll(shifts_details_list);
    wait.value = false;
  }

  get_shift_type()async{
   shift_type_list.value = await shift_repo.get_shift_type();
  }

  get_manger_department()async{

    department_list.value = await dep_repo.get_manger_departments(_signin_controller.model!.userId!);
  }

  get_users_bydepartment()async{
    dropdwon_users_list.clear();
    user_id.value=0;
    users_list = await user_repo.get_users_bydepartment(department_id.value);

    // ----------- choose employee not selected before --------
    for(int i=0;i<users_list.length;i++){
       bool b = true;
      for(int j=0;j<shifts_details_list.length;j++){
        if(updated_user_id != users_list[i].userId && users_list[i].userId == shifts_details_list[j].userId)
           b = false;
      }
      if(b){
        dropdwon_users_list.add(users_list[i]);
      }
    }
    //------------------------------------

  }

  get_userbyid(int id)async{
    user_details_model = await user_repo.get_users_byid(id);
  }

  add_shift()async{
    wait_add_or_update_or_remove_shift = true;
    if(shift_type_id.value==0||user_id.value==0){
      msg = "ادخل جميع البيانات بشكل صحيح";
    }else {
      msg = await shift_repo.add_shift(date, shift_type_id.value, user_id.value, _signin_controller.model!.userId!);
      if(msg=='Created'){
        user_id.value=0;
        department_id.value=0;
        shift_type_id.value=0;
        dropdwon_users_list.value.removeWhere((element) => element.userId == user_id.value );
        get_shifts_in_day();
      }
    }
    wait_add_or_update_or_remove_shift = false;
  }

  edit_shift()async{
    wait_add_or_update_or_remove_shift = true;
    if(shift_type_id.value==0||user_id.value==0){
      msg = "ادخل جميع البيانات بشكل صحيح";
    }else {
      msg = await shift_repo.edit_shift(updated_shift_id,date, shift_type_id.value, user_id.value, _signin_controller.model!.userId!);
      if(msg=='تم التعديل بنجاح'){
        push_notification_from_api(department_id.value.toString());
        user_id.value=0;
        department_id.value=0;
        shift_type_id.value=0;
        dropdwon_users_list.value.removeWhere((element) => element.userId == user_id.value );
        get_shifts_in_day();
      }
    }
    wait_add_or_update_or_remove_shift = false;
  }

  remove_shift(int shift_id)async{
    wait_add_or_update_or_remove_shift = true;
    msg = await shift_repo.remove_shift(shift_id);
    get_shifts_in_day();
    wait_add_or_update_or_remove_shift = false;
  }

  push_notification_from_api(String topic) async {
    await noti_repo.notification_special_department('نبطجيه يوم'+date,
        'تم تعديل نبطجيات اليوم ... انقر للمزيد',
        "https://www.learndash.com/wp-content/uploads/Notification-Add-on.png",
        topic);
  }

  search_in_shifts(String userName){
    search_list.clear();
    if(userName.isEmpty){
      search_list.value.addAll(shifts_details_list);
    }else{
      search_list.value.addAll(shifts_details_list.where((element) =>
          element.userName!.contains(userName) ||element.depName!.contains(userName)));
    }
  }

  @override
  void dispose() {
    Get.delete<Shift_users_controller>();

  }
}