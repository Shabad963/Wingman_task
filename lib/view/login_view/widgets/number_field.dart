import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:wingman_task/config/colors.dart';
import 'package:wingman_task/config/size_config.dart';
import 'package:wingman_task/controller/send_otp_controller.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.controller,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final SendOtpController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: IntlPhoneField(
        enabled: true,
        validator: (value) {
          if (value == null) {
            return 'Please enter valid number';
          }
          return null;
        },
        showCountryFlag: false,
        keyboardType: TextInputType.phone,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ], //
        showDropdownIcon: false,
        cursorColor: Colors.black,
        flagsButtonPadding: const EdgeInsets.only(left: 6, bottom: 1.5),
        dropdownTextStyle: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 12.0.sp,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        dropdownIconPosition: IconPosition.leading,
        controller: controller.mobileNumber,

        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 12.0.sp,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),

        decoration: InputDecoration(
          hintStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 9.0.sp,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          hintText: "Enter Your Mobile number",
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: const EdgeInsets.fromLTRB(8, 15, 10, 5),
          fillColor: greyColor,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0.sp),
            borderSide: const BorderSide(color: Colors.white),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0.sp),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0.sp),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0.sp),
            borderSide: const BorderSide(color: Colors.white),
          ),

          //decoration for Input Field

          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),

        initialCountryCode: 'IN', //default contry code, NP for Nepal
      ),
    );
  }
}
