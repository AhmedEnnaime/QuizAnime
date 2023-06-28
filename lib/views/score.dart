import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_anime/constants.dart';
import 'package:quizz_anime/controllers/questionController.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
        child: Stack(children: [
          Center(
            child: Column(
              children: [
                Spacer(),
                Text(
                  "Score",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: kSecondaryColor),
                ),
                Spacer(),
                Text(
                  "${_qnController.numOfCorrectAns * 10}/${_qnController.questions.length * 10}",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: kSecondaryColor),
                ),
                Spacer(),
                ElevatedButton(
                    onPressed: () {
                      Get.reset();
                      Navigator.pushNamed(context, "home");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Back Home",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: kBlackColor),
                      ),
                    )),
                Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
