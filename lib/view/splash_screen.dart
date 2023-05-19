import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wingman_task/view/home_view.dart';
import 'package:wingman_task/view/login_view/login_view.dart';

class SplashScreen extends StatefulWidget {
  final SharedPreferences prefs;
  final String? token;

  SplashScreen({super.key, required this.prefs, required this.token});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>
                widget.token == null ? LoginView() : HomeView())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(58.0),
        child: Image.asset( 'assets/images/clock.png',
        ),
      )),
    );
  }
}
