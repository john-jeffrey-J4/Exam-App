import 'package:exam_app/data/questions.dart';
import 'package:exam_app/questions.dart';
import 'package:exam_app/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/home_page.dart';

class QuizWidget extends StatefulWidget {
  const QuizWidget({super.key});

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  Widget? activeScreen;

  List<String> selectedAnswerList = [];

  @override
  void initState() {
    super.initState();
    activeScreen = HomePageWidget(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsWidget(
        selectedOptions: chooseAnswer,
      );
    });
  }

  void refreshButton() {
    setState(() {
      selectedAnswerList = [];
      activeScreen = HomePageWidget(switchScreen);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswerList.add(answer);

    if (selectedAnswerList.length == questions.length) {
      setState(() {
        activeScreen = ResultScreenWidget(
          chooseAnswerList: selectedAnswerList,
          refreshButton: refreshButton,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 12, 3, 112),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
