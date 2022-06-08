abstract class Notification_repo{

  Future<String> notification_multiple_departments(String noti_title,String noti_body,String noti_image,String topics);

  Future<String> notification_special_department(String noti_title,String noti_body,String noti_image,String topic);

}