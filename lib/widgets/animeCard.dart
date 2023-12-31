import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:quizz_anime/controllers/questionController.dart';

class AnimeCard extends StatelessWidget {
  final String anime;
  final String image;

  AnimeCard({required this.anime, required this.image});

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(QuestionController());

    void onSelectAnime(String anime) {
      questionController.loadQuestions(anime);
    }

    return Container(
      width: 150,
      height: 265,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              // alignment: Alignment.center,
              child: Image.asset(
                "assets/${image}",
                height: 150,
              ),
            ),
            Text(
              '$anime',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                onSelectAnime(anime);
                Navigator.pushNamed(context, "quiz");
              },
              child: Text(
                "Start Quiz",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
