import 'package:flutter/material.dart';
import 'package:quizz_anime/constants.dart';
import 'package:quizz_anime/widgets/progressBar.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
      child: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                children: [ProgressBar()],
              ),
            ),
          )
        ],
      ),
    );
  }
}
