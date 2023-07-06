import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_anime/models/Question.dart';
import 'package:quizz_anime/questions_options.dart';
import 'package:quizz_anime/views/score.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  Animation<double> get animation => this._animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = [];

  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAns;
  int get correctAns => this._correctAns;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  late int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  @override
  void onInit() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });
    _animationController.forward().whenComplete(nextQuestion);

    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer ?? 0;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;

      if (_pageController.hasClients && _pageController.positions.isNotEmpty) {
        _pageController.nextPage(
          duration: Duration(milliseconds: 250),
          curve: Curves.ease,
        );
      }

      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.to(() => ScorePage());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  void loadQuestions(String anime) {
    switch (anime) {
      case 'One piece':
        _questions = OnePiece.map((question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index'])).toList();
        break;
      case 'Jujutsu Kaisen':
        _questions = JJK
            .map((question) => Question(
                id: question['id'],
                question: question['question'],
                options: question['options'],
                answer: question['answer_index']))
            .toList();
        print('Loaded Kimetsu questions: $_questions');
        break;
      case 'Kimetsu':
        _questions = Kimetsu.map((question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index'])).toList();
        break;
      case 'Naruto':
        _questions = Naruto.map((question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index'])).toList();
        break;
      // Add more cases for other animes
    }

    _questionNumber.value = 1;

    resetTimer();
  }

  void resetTimer() {
    _animationController.reset();
    _animationController.forward().whenComplete(nextQuestion);
  }
}
