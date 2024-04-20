import 'package:exam_app/data/questions.dart';
import 'package:exam_app/models/quiz_questions.dart';
import 'package:exam_app/option_button.dart';
import 'package:flutter/material.dart';

class QuestionsWidget extends StatefulWidget {
  const QuestionsWidget({super.key, required this.selectedOptions});
  final void Function(String optionSelected) selectedOptions;
  @override
  State<QuestionsWidget> createState() {
    return _QuestionsWidgetState();
  }
}

class _QuestionsWidgetState extends State<QuestionsWidget> {
  var questionNumber = 0;
  void nextQuestion(String optionSelected) {
    widget.selectedOptions(optionSelected);
    setState(() {
      questionNumber++;
    });
  }

  @override
  Widget build(context) {
    final QuizQuestion currentQuestion = questions[questionNumber];
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.getShuffledOptions().map(
                  (option) => OptionButton(
                    option: option,
                    onTap: () {
                      nextQuestion(option);
                    },
                  ),
                )
          ],
        ),
      ),
    );
  }
}
