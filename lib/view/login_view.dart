import 'dart:ui' as prefix;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wingman_task/config/colors.dart';
import 'package:wingman_task/config/size_config.dart';
import 'package:wingman_task/config/utils.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wingman_task/controller/controller.dart';
import 'package:wingman_task/service/send_otp_service.dart';
import 'package:wingman_task/view/otp_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with TickerProviderStateMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  AnimationController? _animationController1;
  Animation<double>? _animation1;
  AnimationController? _animationController2;
  Animation<double>? _animation2;
  AnimationController? _animationController3;
  Animation<double>? _animation3;
  AnimationController? _animationController4;
  Animation<double>? _animation4;

  @override
  void initState() {
    // TODO: implement initState
    _animationController1 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation1 =
        Tween<double>(begin: -1.0, end: 0.0).animate(_animationController1!);

    _animationController2 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation2 =
        Tween<double>(begin: -1.0, end: 0.0).animate(_animationController2!);

    _animationController3 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation3 =
        Tween<double>(begin: 1.0, end: 0.0).animate(_animationController3!);

    _animationController4 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation4 =
        Tween<double>(begin: -1.0, end: 0.0).animate(_animationController4!);
    _animationController1!.forward();
    _animationController2!.forward();
    _animationController3!.forward();
    _animationController4!.forward();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _animationController1!.dispose();
    _animationController2!.dispose();
    _animationController3!.dispose();
    _animationController4!.dispose();

    super.dispose();
  }

  Controller controller = Get.put(Controller());

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "LOGIN"),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.indigo],
          ),
        ),
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                  animation: _animationController1!,
                  builder: (context, child) {
                    return Transform(
                      transform: Matrix4.translationValues(
                          0.0, _animation1!.value * 200.0, 0.0),
                      child: child,
                    );
                  },
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50.0,
                      height: 3,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              AnimatedBuilder(
                animation: _animationController2!,
                builder: (context, child) {
                  return Transform(
                    transform: Matrix4.translationValues(
                      _animation2!.value * MediaQuery.of(context).size.width,
                      0.0,
                      0.0,
                    ),
                    child: child,
                  );
                },
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, top: 5, right: 8),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 15, top: 4, left: 2),
                      child: Column(children: <Widget>[
                        IntlPhoneField(
                          enabled: true,
                          validator: (value) {
                            if (value == null) {
                              return 'Please enter some text';
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
                          flagsButtonPadding:
                              const EdgeInsets.only(left: 6, bottom: 1.5),
                          dropdownTextStyle: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 10.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          dropdownIconPosition: IconPosition.leading,
                          controller: controller.mobileNumber,

                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 10.0.sp,
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
                            contentPadding:
                                const EdgeInsets.fromLTRB(8, 15, 10, 5),
                            fillColor: white_color,
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

                          initialCountryCode:
                              'IN', //default contry code, NP for Nepal
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                          onCountryChanged: (country) {
                            print('Country changed to: ${country.name}');
                          },
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              AnimatedBuilder(
                  animation: _animationController1!,
                  builder: (context, child) {
                    return Transform(
                      transform: Matrix4.translationValues(
                          0.0, _animation1!.value * -200.0, 0.0),
                      child: child,
                    );
                  },
                  child: Column(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          bool number = false;

                          if (!_formKey.currentState!.validate()) {
                            number = false;
                            controller.toaster("Enter valid number");
                          } else {
                            SendOtpService.sendOtpService(mobile: controller.mobileNumber.text);
                            Get.to(() => OtpView());
                          }
                        },
                        label: Text(
                          'Log in',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                            minimumSize: Size.fromHeight(40),
                            backgroundColor: lightBlueAccent),
                        icon: Icon(Icons.lock),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      GestureDetector(
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: lightBlueAccent,
                              fontSize: 20),
                        ),
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      // RichText(
                      //     text: TextSpan(
                      //         style: TextStyle(color: Colors.black),
                      //         text: 'No account?   ',
                      //         children: [
                      //       TextSpan(
                      //           recognizer: TapGestureRecognizer()
                      //             ..onTap = widget.onClickedSignUp,
                      //           text: 'SignUp',
                      //           style: TextStyle(color: lightBlueAccent))
                      //     ]))
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
