import 'package:exam_app/data/question_data.dart';
import 'package:exam_app/questions_page.dart';
import 'package:exam_app/quiz_start_page.dart';
import 'package:exam_app/result_page.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  Widget? activeScreen;
  List<String> selectedAnswerList = [];

  @override
  void initState() {
    super.initState();
    activeScreen = StartQuizPage(questionsPageRoute);
  }

  void answeredQuestions(String selectedAnswer) {
    selectedAnswerList.add(selectedAnswer);

    if (selectedAnswerList.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(
          chosenAnswers: selectedAnswerList,
        );
      });
    }
  }

  void questionsPageRoute() {
    setState(() {
      activeScreen = QuestionsPage(answeredQuestions);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 31, 4, 119),
        body: activeScreen,
      ),
    );
  }
}
