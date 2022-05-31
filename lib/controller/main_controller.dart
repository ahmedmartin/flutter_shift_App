import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';


import '../main.dart';



class Main_controller extends GetxController{

  Map data={};

  String ?token;




  @override
  Future<void> onInit() async {
    FirebaseMessaging.instance.requestPermission(sound: true,alert: true);



    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print("onMessageOpenedApp: $message");
      data = message.data;
      //Get.to(notification_info());
    });

    token = await FirebaseMessaging.instance.getToken();

    FirebaseMessaging.instance.subscribeToTopic('tt');

    // initializition_local_notification();

    super.onInit();
  }





  // initializition_local_notification() async {
  //   var initializationSettingsAndroid =
  //   AndroidInitializationSettings('@mipmap/ic_launcher');
  //   var initializationSettingsIOS = IOSInitializationSettings(
  //       requestAlertPermission: true,
  //       requestBadgePermission: true,
  //       requestSoundPermission: true,
  //       onDidReceiveLocalNotification: (int id, String ?title, String ?body, String ?payload) async {});
  //   var initializationSettings = InitializationSettings(android: initializationSettingsAndroid,iOS: initializationSettingsIOS);
  //   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //      onSelectNotification: (String ?payload) async {
  //       if (payload != null) {
  //         Map<String,dynamic> mapData = jsonDecode(payload);
  //         data = mapData;
  //        // Get.to(notification_info());
  //       }
  //     });
  // }

}