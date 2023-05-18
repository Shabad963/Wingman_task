import 'dart:developer';
import 'dart:ui' as prefix;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wingman_task/config/colors.dart';
import 'package:wingman_task/config/constant.dart';
import 'package:wingman_task/config/size_config.dart';
import 'package:wingman_task/config/utils.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wingman_task/controller/details_controller.dart';
import 'package:wingman_task/controller/send_otp_controller.dart';
import 'package:wingman_task/view/home_view.dart';
import 'package:wingman_task/view/otp_view.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView>
    with TickerProviderStateMixin {
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
    controller.emailController.dispose();
    controller.nameController.dispose();
    _animationController1!.dispose();
    _animationController2!.dispose();
    _animationController3!.dispose();
    _animationController4!.dispose();

    super.dispose();
  }

  DetailsController controller = Get.put(DetailsController());

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Submit Details"),
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
                animation: _animationController3!,
                builder: (context, child) {
                  return Transform(
                    transform: Matrix4.translationValues(
                      _animation3!.value * MediaQuery.of(context).size.width,
                      0.0,
                      0.0,
                    ),
                    child: child,
                  );
                },
                child: TextFormField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                      labelText: 'Name', border: OutlineInputBorder()),
                  obscureText: false,
                ),
              ),
              SizedBox(
                height: 15,
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
                child: TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                      labelText: 'Email', border: OutlineInputBorder()),
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
                        onPressed: () async {
                          controller.submitDetails(
                              name: controller.nameController.text,
                              email: controller.emailController.text);

                          Get.to(() => HomeView());
                        },
                        label: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                            minimumSize: Size.fromHeight(40),
                            backgroundColor: lightBlueAccent),
                        icon: Icon(Icons.lock),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
