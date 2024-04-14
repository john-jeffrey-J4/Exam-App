import 'package:exam_app/data/question_data.dart';
import 'package:exam_app/models/question_model.dart';
import 'package:exam_app/options_button.dart';
import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage(this.answeredQuestions, {super.key});
  final void Function(String optionSelected) answeredQuestions;
  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  var currentQuestionNumber = 0;
  void changeQuestionNumber(String selectedOption) {
    widget.answeredQuestions(selectedOption);
    setState(() {
      currentQuestionNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final QuizQuestions oneByOneQuestions = questions[currentQuestionNumber];
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              oneByOneQuestions.text,
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...oneByOneQuestions.getShuffledList().map(
                  (option) => OptionButton(
                    option: option,
                    onTap: () {
                      changeQuestionNumber(option);
                    },
                  ),
                )
          ],
        ),
      ),
    );
  }
}
