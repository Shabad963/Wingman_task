import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wingman_task/common/common_widgets.dart';
import 'package:wingman_task/config/colors.dart';
import 'package:wingman_task/config/constant.dart';
import 'package:wingman_task/model/details_model.dart';
import 'package:wingman_task/model/send_otp_model.dart';
import 'package:wingman_task/service/details_service.dart';
import 'package:wingman_task/service/send_otp_service.dart';
import 'package:wingman_task/view/home_view.dart';

class DetailsController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  RxBool nullData = true.obs;
  final List<DetailsModel> sumbitDetail = [];

  List<DetailsModel> get sumbitDetails {
    return [...sumbitDetail];
  }

  Future submitData({
    required String name,
    required String email,
  }) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var data = await DetailsService.detailsService(name: name, email: email);

      if (data != null) {
        sharedPreferences.setString(Constants.name, nameController.text);
        sharedPreferences.setString(Constants.email, emailController.text);
        sumbitDetail.clear();
        sumbitDetail.add(data);
        nullData(false);
      } else {
        nullData(false);
      }
    } catch (e) {
      rethrow;
    }
  }



  Future submitdetails(context) async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty) {
      toaster("Please fill all fields");
    } else {
      loadingBar(context);
      // final isValid = formKey.currentState!.validate();
      // if (!isValid) return;
      await submitData(
          name: nameController.text,
          email: emailController.text);
      Get.back();

      Get.offAll(() => HomeView());
    }
  }

}
