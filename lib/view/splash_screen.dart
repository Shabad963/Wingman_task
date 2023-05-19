import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wingman_task/common/common_widgets.dart';
import 'package:wingman_task/config/colors.dart';
import 'package:wingman_task/config/size_config.dart';
import 'package:wingman_task/view/home_view.dart';
import 'package:wingman_task/view/login_view/login_view.dart';

class SplashScreen extends StatefulWidget {
  final SharedPreferences prefs;
  final String? token;

  SplashScreen({super.key, required this.prefs, required this.token});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>    with TickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;
  AnimationController? _controllertop;
  Animation<Offset>? _animationtop;
  //AnimationController? _controllerbottom;
  Animation<Offset>? _animationbottom;
  @override
  void initState() {
    super.initState();
   
   controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeIn);
    controller!.forward();
//top Image

    _controllertop = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _animationtop = Tween<Offset>(
      begin: const Offset(0.0, 10.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controllertop!,
      curve: Curves.easeIn,
    ));

    _animationbottom = Tween<Offset>(
      begin: const Offset(0.0, -5.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controllertop!,
      curve: Curves.easeIn,
    ));
    _controllertop?.forward();

    Timer(
        const Duration(seconds: 4),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>
                widget.token == null ? LoginView() : HomeView())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_color,
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: 100.00.hp,
            width: 100.00.wp,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  white_color,
                  primary_color,
                  white_color
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100.00.hp,
            width: 100.00.wp,
            child: Stack(
              children: [
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.max,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Align(
                    //   alignment: Alignment.topCenter,
                    //   child: SlideTransition(
                    //       position: _animationbottom!,
                    //       child: Container(
                    //         height: 15.00.hp,
                    //         width: 100.00.wp,
                    //         decoration: const BoxDecoration(
                    //             image: DecorationImage(
                    //                 fit: BoxFit.fitHeight,
                    //                 image:
                    //                     AssetImage('assets/images/wingman.jpg'))),
                    //       )),
                    // ),
                    SizedBox(
                      height: 20.00.hp,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: FadeTransition(
                        opacity: animation!,
                        child: const Center(
                            child:  MainImage(),),
                      ),
                    ),
                    // Expanded(
                    //   child: Align(
                    //     alignment: Alignment.bottomCenter,
                    //     child: SlideTransition(
                    //         position: _animationbottom!,
                    //         child: Container(
                    //           height: 60.00.hp,
                    //           width: 100.00.wp,
                    //           decoration: const BoxDecoration(
                    //               image: DecorationImage(
                    //                   fit: BoxFit.fill,
                    //                   image: AssetImage(
                    //                     'assets/images/clock.png',
                    //                   ))),
                    //         )),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}