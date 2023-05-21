import 'package:flutter/material.dart';
import 'package:wingman_task/common/animated_widget.dart';
import 'package:wingman_task/common/common_widgets.dart';
import 'package:wingman_task/config/colors.dart';
import 'package:wingman_task/config/size_config.dart';
import 'package:wingman_task/common/appbar.dart';
import 'package:get/get.dart';
import 'package:wingman_task/controller/details_controller.dart';

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


  @override
  void initState() {
        super.initState();
    _animationController1 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation1 =
        Tween<double>(begin: -1.0, end: 0.0).animate(_animationController1!);

    _animationController2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation2 =
        Tween<double>(begin: -1.0, end: 0.0).animate(_animationController2!);

    _animationController3 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation3 =
        Tween<double>(begin: 1.0, end: 0.0).animate(_animationController3!);

    _animationController1!.forward();
    _animationController2!.forward();
    _animationController3!.forward();
  }

  @override
  void dispose() {
    controller.emailController.dispose();
    controller.nameController.dispose();
    _animationController1!.dispose();
    _animationController2!.dispose();
    _animationController3!.dispose();

    super.dispose();
  }

  DetailsController controller = Get.put(DetailsController());

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: whiteColor,
      appBar: appBar(title: ""),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedWidgetCommon(
              animationController: _animationController1,
              animation: _animation1,
              width: 200.0,
              child: CommonText(
                title:
                    'Looks like you are new here.\nTell us a bit about yourself.',
                fontsize: 15.0.sp,
              ),
            ),
            SizedBox(
              height: 2.0.hp,
            ),
            AnimatedWidgetCommon(
              animationController: _animationController3,
              animation: _animation3,
              width: width,
              child: TextFormField(
                controller: controller.nameController,
                decoration: const InputDecoration(
                    labelText: 'Name', border: OutlineInputBorder()),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (value) => value != null && value.length < 4
                //     ? 'Enter min 4 characters'
                //     : null,
              ),
            ),
            SizedBox(
              height: 2.0.hp,
            ),
            AnimatedWidgetCommon(
              animationController: _animationController2,
              animation: _animation2,
              width: width,
              child: TextFormField(
                controller: controller.emailController,
                decoration: const InputDecoration(
                    labelText: 'Email', border: OutlineInputBorder()),
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (email) =>
                //     email != null && !EmailValidator.validate(email)
                //         ? 'Enter a valid email'
                //         : null,
              ),
            ),
            SizedBox(
              height: 5.5.hp,
            ),
            AnimatedWidgetCommon(
                animationController: _animationController1,
                animation: _animation1,
                width: -200.0,
                child: commonButton(
                    context: context,
                    title: 'Submit',
                    action: () {
                      controller.submitdetails(context);
                    })),
          ],
        ),
      ),
    );
  }
}
