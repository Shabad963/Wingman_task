import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:wingman_task/config/colors.dart';
import 'package:wingman_task/controller/controller.dart';
import 'package:wingman_task/view/details_view.dart';

class OtpView extends StatelessWidget {
  OtpView({super.key});

  OtpFieldController otpController = OtpFieldController();

  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OTPTextField(
                controller: otpController,
                length: 5,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 45,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 15,
                style: TextStyle(fontSize: 17),
                onChanged: (pin) {
                  log("Changed: " + pin);
                },
                onCompleted: (pin) {
                  log("Completed: " + pin);
                  controller.otp = pin;
                  log("saved: " + controller.otp);
                }),
            ElevatedButton.icon(
              onPressed: () {
                Get.to(() => DetailsView());
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
    );
  }
}
