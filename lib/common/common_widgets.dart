import 'package:fluttertoast/fluttertoast.dart';
import 'package:wingman_task/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:wingman_task/config/size_config.dart';

class CommonText extends StatelessWidget {
  final double fontsize;
  final String title;

  const CommonText({
    super.key,
    required this.fontsize,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: black_color,
        fontSize: fontsize,
        height: 3,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

SizedBox commonButton(
    {required BuildContext context,
    required VoidCallback action,
    required String title}) {
  return SizedBox(
    height: 7.0.hp,
    width: double.infinity,
    child: ElevatedButton(
      onPressed: action,
      child: Text(
        title,
        style: TextStyle(color: white_color, fontSize: 13.0.sp),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: primary_color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
    ),
  );
}

SizedBox commonButtonOutlined(
    {required BuildContext context,
    required VoidCallback action,
    required String title}) {
  return SizedBox(
    height: 7.0.hp,
    width: double.infinity,
    child: OutlinedButton(
      onPressed: action,
      child: Text(
        title,
        style: TextStyle(color: black_color, fontSize: 13.0.sp),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: black_color, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
    ),
  );
}

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
