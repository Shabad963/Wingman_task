import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:wingman_task/common/common_widgets.dart';
import 'package:wingman_task/common/animated_widget.dart';

import 'package:wingman_task/config/colors.dart';
import 'package:wingman_task/config/size_config.dart';
import 'package:wingman_task/common/appbar.dart';
import 'package:get/get.dart';
import 'package:wingman_task/controller/send_otp_controller.dart';
import 'package:wingman_task/view/login_view/widgets/number_field.dart';
import 'package:wingman_task/view/otp_view/otp_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _animation =
        Tween<double>(begin: -1.0, end: 0.0).animate(_animationController!);

    _animationController!.forward();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  SendOtpController controller = Get.put(SendOtpController());

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: appBar(title: ""),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0.wp),
          child: AnimatedWidgetCommon(
            animationController: _animationController,
            animation: _animation,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MainImage(),
                SizedBox(
                  height: 2.0.hp,
                ),
                CommonText(
                  title: 'Log in or sign up',
                  fontsize: 15.0.sp,
                ),
                SizedBox(
                  height: 2.0.hp,
                ),
                PhoneNumberField(formKey: _formKey, controller: controller),
                SizedBox(
                  height: 3.5.hp,
                ),
                commonButton(
                    context: context,
                    title: 'Continue',
                    action: () async {
                      sendOtp(context);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future sendOtp(context) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    bool number = false;

    if (!_formKey.currentState!.validate()) {
      number = false;
      toaster("Enter valid number");
    } else {
      if (connectivityResult == ConnectivityResult.none) {
        toaster("No internet connection");
      } else {
        loadingBar(context);
        await controller.getOtpDetails(mobile: controller.mobileNumber.text);
        Get.back();
        Get.to(() =>  OtpView(), transition: Transition.rightToLeft);
      }
    }
  }
}
