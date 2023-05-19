import 'package:flutter/material.dart';

class AnimatedWidgetCommon extends StatelessWidget {
  const AnimatedWidgetCommon(
      {super.key,
      required AnimationController? animationController,
      required Animation<double>? animation,
      required this.width,
      required this.child})
      : _animationController = animationController,
        _animation = animation;

  final AnimationController? _animationController;
  final Animation<double>? _animation;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController!,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.translationValues(
              _animation!.value * width,
              0.0,
              0.0,
            ),
            child: child,
          );
        },
        child: child);
  }
}
