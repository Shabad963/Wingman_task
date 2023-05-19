 import 'package:fluttertoast/fluttertoast.dart';
import 'package:wingman_task/config/colors.dart';
import 'package:flutter/material.dart';

 
  void toaster(title) {
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: black_color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void loadingBar(BuildContext ctx) {
    showDialog(
        barrierDismissible: false,
        context: ctx,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }