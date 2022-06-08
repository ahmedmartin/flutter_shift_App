import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/user_count_model.dart';

class User_list extends StatelessWidget{

  List<User_count_model>all_users;

  User_list(this.all_users);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: all_users.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(all_users[index].userName!,style: TextStyle(color:Color(0xff005194),fontSize: 20,fontWeight: FontWeight.w900 ),),
              trailing:Text(all_users[index].count!.toString(),style: TextStyle(
                  color:Color(0xff005194),fontWeight: FontWeight.bold ,fontSize: 20),) ,
            );
          }),
    );
  }
}