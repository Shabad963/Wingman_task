import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wingman_task/config/colors.dart';
import 'package:wingman_task/model/details_model.dart';
import 'package:wingman_task/model/send_otp_model.dart';
import 'package:wingman_task/service/details_service.dart';
import 'package:wingman_task/service/send_otp_service.dart';

class DetailsController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  RxBool nullData = true.obs;
  final List<DetailsModel> sumbitDetail = [];

  List<DetailsModel> get sumbitDetails {
    return [...sumbitDetail];
  }

  Future submitDetails({
    required String name,
    required String email,
  }) async {
    try {
      var data = await DetailsService.detailsService(name: name, email: email);

      if (data != null) {
        sumbitDetail.add(data);
        nullData(false);
      } else {
        nullData(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
