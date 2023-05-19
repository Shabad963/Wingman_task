import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wingman_task/common/common_widgets.dart';

import 'package:wingman_task/config/colors.dart';
import 'package:wingman_task/config/size_config.dart';
import 'package:wingman_task/config/utils.dart';
import 'package:wingman_task/view/login_view/login_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white_color,
        appBar: appBar(title: "Home"),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const MainImage(),
              CommonText(
                title: 'Logged in as User1235',
                fontsize: 15.0.sp,
              ),
              commonButtonOutlined(
                  context: context,
                  title: 'Log out',
                  action: () async {
                    logOut(context);
                  })
            ],
          ),
        ));
  }

  Future logOut(context) async {
    loadingBar(context);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Get.back();
    Get.offAll(() => LoginView());
  }
}
