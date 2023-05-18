import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wingman_task/config/constant.dart';
import 'package:wingman_task/model/verify_otp_model.dart';
import 'package:wingman_task/service/verify_otp_service.dart';

class VerifyOtpController extends GetxController {
  String otp = "";

  RxBool nullData = true.obs;
  final List<VerifyOtpModel> verifyDetail = [];

  List<VerifyOtpModel> get verifyDetails {
    return [...verifyDetail];
  }

  Future verifyOtpDetails({
    required String requestId,
    required String code,
  }) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      var data = await VerifyOtpService.verifyOtpService(
          requestId: requestId, code: code);

      if (data != null) {
        sharedPreferences.setString(Constants.authToken, data.jwt ?? "");
       
        verifyDetail.clear();
        verifyDetail.add(data);
        nullData(false);
      } else {
        nullData(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
