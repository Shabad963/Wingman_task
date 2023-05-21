import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:wingman_task/controller/verfy_otp_controller.dart';

class OtpField extends StatelessWidget {
  const OtpField({
    super.key,
    required this.otpController,
    required this.controller,
  });

  final OtpFieldController otpController;
  final VerifyOtpController controller;

  @override
  Widget build(BuildContext context) {
    return OTPTextField(
      controller: otpController,
      length: 6,
      width: MediaQuery.of(context).size.width,
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldWidth: 45,
      fieldStyle: FieldStyle.box,
      outlineBorderRadius: 15,
      style: const TextStyle(fontSize: 17),
      onChanged: (pin) {
        controller.otp = pin;
        log("saved: ${controller.otp}");
      },
    );
  }
}
