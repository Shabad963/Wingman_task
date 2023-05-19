import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wingman_task/config/check_login.dart';
import 'package:wingman_task/config/constant.dart';
import 'package:wingman_task/view/home_view.dart';
import 'package:wingman_task/view/login_view.dart';


Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
   token = await CheckLogin().checkLogin();
  runApp( MyApp(prefs: prefs,));
}

late String? token;

class MyApp extends StatelessWidget {
    final SharedPreferences prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wingman Task',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: token == null ? LoginView() : HomeView(),
    );
  }
}
