import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wingman_task/config/colors.dart';

AppBar appBar({required String title}) {
  return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(color: blackColor),
      ),
      backgroundColor: Colors.white,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: whiteColor,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light,
      ));
}
