import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wingman_task/common/common_widgets.dart';

import 'package:wingman_task/config/colors.dart';
import 'package:wingman_task/config/constant.dart';
import 'package:wingman_task/config/size_config.dart';
import 'package:wingman_task/config/utils.dart';
import 'package:wingman_task/view/login_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       backgroundColor: white_color,
      appBar: appBar(title: "Home"),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Text(
                  'Logged in as ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0.sp,
                    height: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
             Text(
                  'Logged in as ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0.sp,
                    height: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                     loadingBar(context);
                 SharedPreferences preferences = await SharedPreferences. getInstance(); 
                 await preferences. clear();
                 Get.back();
                 Get.offAll(()=>LoginView());
                  },
                  label: Text(
                    'Logout',
                    style: TextStyle(color:white_color ),
                  ),
                  style: TextButton.styleFrom(
                      minimumSize: Size.fromHeight(40),
                      backgroundColor: black_color),
                  icon: Icon(Icons.lock),
                ),
           
          ],
        ),
      )
    );
  }
}