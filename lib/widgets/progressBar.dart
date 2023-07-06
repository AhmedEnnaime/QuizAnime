import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_anime/constants.dart';
import 'package:quizz_anime/controllers/questionController.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF3F4768), width: 3),
          borderRadius: BorderRadius.circular(50)),
      child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            // print(controller.animation.value);
            return Stack(
              children: [
                LayoutBuilder(
                    builder: (context, constraints) => Container(
                          width:
                              constraints.maxWidth * controller.animation.value,
                          decoration: BoxDecoration(
                              gradient: kPrimaryGradient,
                              borderRadius: BorderRadius.circular(50)),
                        )),
                Positioned.fill(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${(controller.animation.value * 60).round()} sec"),
                      WebsafeSvg.asset("assets/clock.svg")
                    ],
                  ),
                ))
              ],
            );
          }),
    );
  }
}
