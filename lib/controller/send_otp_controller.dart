import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wingman_task/model/send_otp_model.dart';
import 'package:wingman_task/service/send_otp_service.dart';

class SendOtpController extends GetxController {
  TextEditingController mobileNumber = TextEditingController();

  RxBool nullData = true.obs;
  final List<SendOtpModel> otpDetail = [];

  List<SendOtpModel> get otpDetails {
    return [...otpDetail];
  }

  Future getOtpDetails({
    required String mobile,
  }) async {
    try {
      var data = await SendOtpService.sendOtpService(mobile: mobile);

      if (data != null) {
        otpDetail.clear;
        otpDetail.add(data);
        nullData(false);
      } else {
        nullData(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
