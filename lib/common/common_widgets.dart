import 'package:fluttertoast/fluttertoast.dart';
import 'package:wingman_task/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:wingman_task/config/size_config.dart';

class MainImage extends StatelessWidget {
  const MainImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/wingman.jpg',
      height: 100,
      width: 200,
    );
  }
}

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
        color: blackColor,
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
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
      child: Text(
        title,
        style: TextStyle(color: whiteColor, fontSize: 13.0.sp),
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
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: blackColor, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
      child: Text(
        title,
        style: TextStyle(color: blackColor, fontSize: 13.0.sp),
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
      backgroundColor: blackColor,
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
