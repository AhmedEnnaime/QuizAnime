import 'package:flutter/material.dart';
import 'package:quizz_anime/views/home.dart';
import 'package:quizz_anime/views/quiz.dart';
import 'package:quizz_anime/views/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        'home': (context) => HomePage(),
        'quiz': (context) => QuizPage(),
      },
    );
  }
}
