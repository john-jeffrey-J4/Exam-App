import 'package:flutter/material.dart';

class StartQuizPage extends StatelessWidget {
  const StartQuizPage(this.questionsPageRoute,{super.key});
  final void Function() questionsPageRoute;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(150, 228, 229, 230),
          ),
          const SizedBox(
            height: 40,
          ),
          const Opacity(
            opacity: 0.6,
            child: Text(
              "Learn Flutter in a fun way!",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_right_alt_outlined),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: questionsPageRoute,
            label: const Text(
              "Start Quiz",
            ),
          )
        ],
      ),
    );
  }
}
