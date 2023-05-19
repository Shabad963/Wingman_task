
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:wingman_task/common/common_widgets.dart';
import 'package:wingman_task/config/colors.dart';
import 'package:wingman_task/config/size_config.dart';
import 'package:wingman_task/config/utils.dart';
import 'package:wingman_task/controller/send_otp_controller.dart';
import 'package:wingman_task/controller/verfy_otp_controller.dart';
import 'package:wingman_task/view/otp_view/widgets/otp_field.dart';

class OtpView extends StatelessWidget {
  OtpView({super.key});

  OtpFieldController otpController = OtpFieldController();

  VerifyOtpController controller = Get.put(VerifyOtpController());

  SendOtpController sendOtpController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_color,
      appBar: appBar(title: ""),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              title: 'Enter OTP',
              fontsize: 25.0.sp,
            ),
            CommonText(
              title:
                  'OTP has been sent to +91 ${sendOtpController.mobileNumber.text}',
              fontsize: 12.0.sp,
            ),
            SizedBox(height: 5.0.hp),
            OtpField(otpController: otpController, controller: controller),
            SizedBox(height: 7.0.hp),
            commonButton(
                context: context,
                title: 'Verify otp',
                action: () {
                  controller.verifyOtp(context);
                }),
            SizedBox(height: 3.0.hp),
            commonButtonOutlined(
                context: context,
                title: 'Retry',
                action: () {
                  Get.back();
                }),
          ],
        ),
      ),
    );
  }
}
