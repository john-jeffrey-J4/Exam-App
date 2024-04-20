import 'package:exam_app/answer_display.dart';
import 'package:exam_app/data/questions.dart';
import 'package:flutter/material.dart';

class ResultScreenWidget extends StatefulWidget {
  const ResultScreenWidget(
      {super.key, required this.chooseAnswerList, required this.refreshButton});

  final List<String> chooseAnswerList;
  final void Function() refreshButton;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chooseAnswerList.length; i++) {
      summary.add(
        {
          "question_index": i,
          "question": questions[i].text,
          "correct_answer": questions[i].answers[0],
          "user_answer": chooseAnswerList[i],
        },
      );
    }
    return summary;
  }

  int numOfCorrectAnswers() {
    final int numberOfCrtAns;
    numberOfCrtAns = getSummaryData().where((data) {
      return data["correct_answer"] == data["user_answer"];
    }).length;
    return numberOfCrtAns;
  }

  @override
  State<ResultScreenWidget> createState() => _ResultScreenWidgetState();
}

class _ResultScreenWidgetState extends State<ResultScreenWidget> {
  @override
  Widget build(BuildContext context) {
    final int numberOfCorrectAnswers = widget.numOfCorrectAnswers();
    final int totalNumberOfQuestions = questions.length;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You have answered $numberOfCorrectAnswers out of $totalNumberOfQuestions",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ShowAnswerWidget(
              widget.getSummaryData(),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                widget.refreshButton();
              },
              child: const Text(
                "Reload Quiz!",
              ),
            )
          ],
        ),
      ),
    );
  }
}
