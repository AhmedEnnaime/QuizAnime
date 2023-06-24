import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  Animation<double> get animation => this._animation;

  @override
  void onInit() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });
    _animationController.forward();
    super.onInit();
  }
}
