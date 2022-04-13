import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shieft/view/signin.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Signin(),
    );
  }
}

