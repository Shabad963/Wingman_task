import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wingman_task/common/common_widgets.dart';
import 'package:wingman_task/config/constant.dart';
import 'package:wingman_task/controller/send_otp_controller.dart';
import 'package:wingman_task/model/verify_otp_model.dart';
import 'package:wingman_task/service/verify_otp_service.dart';
import 'package:wingman_task/view/details_view.dart';
import 'package:wingman_task/view/home_view.dart';

class VerifyOtpController extends GetxController {
  SendOtpController sendOtpController = Get.find();

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

  Future verifyOtp(context) async {
    if (otp.length < 6) {
      toaster("Enter full otp");
    } else {
      loadingBar(context);
      await verifyOtpDetails(
          requestId: sendOtpController.otpDetail[0].requestId, code: otp);
      if (verifyDetail[0].status == false) {
        Get.back();
        toaster("Invalid otp");
      } else {
        if (verifyDetail[0].profileExists == false) {
          Get.back();
          Get.to(() => DetailsView(), transition: Transition.rightToLeft);
        } else {
          Get.back();
          Get.offAll(() => HomeView(), transition: Transition.rightToLeft);
        }
      }
    }
  }
}
