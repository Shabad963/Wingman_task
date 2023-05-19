import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:wingman_task/common/common_widgets.dart';
import 'package:wingman_task/config/colors.dart';
import 'package:wingman_task/config/size_config.dart';
import 'package:wingman_task/config/utils.dart';
import 'package:wingman_task/controller/send_otp_controller.dart';
import 'package:wingman_task/controller/verfy_otp_controller.dart';
import 'package:wingman_task/service/verify_otp_service.dart';
import 'package:wingman_task/view/details_view.dart';
import 'package:wingman_task/view/home_view.dart';

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
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter OTP',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0.sp,
                  height: 3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'OTP has been sent to +91 ${sendOtpController.mobileNumber.text}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.0.sp,
                  height: 3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0.hp),
              OTPTextField(
                controller: otpController,
                length: 6,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 45,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 15,
                style: TextStyle(fontSize: 17),
                onChanged: (pin) {
                  controller.otp = pin;
                  log("saved: ${controller.otp}");
                },
              ),
              SizedBox(height: 7.0.hp),
              ElevatedButton.icon(
                onPressed: () async {
                     controller.verifyOtp(context);
                },
                label: Text(
                  'Verify',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                    minimumSize: Size.fromHeight(40),
                    backgroundColor: black_color),
                icon: Icon(Icons.lock),
              ),
              SizedBox(height: 3.0.hp),
              ElevatedButton.icon(
                onPressed: () {
               Get.back();
                },
                label: Text(
                  'Retry',
                  style: TextStyle(color: black_color),
                ),
                style: TextButton.styleFrom(
                    minimumSize: Size.fromHeight(40),
                    backgroundColor: white_color),
                icon: Icon(Icons.lock),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
