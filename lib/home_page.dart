import 'package:flutter/material.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget(this.switchScreen, {super.key});
  final void Function() switchScreen;
  @override
  Widget build(context) {
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
          const Text(
            "Learn Flutter in a fun way!!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_right_alt),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              shape: const BeveledRectangleBorder(),
              side: const BorderSide(color: Colors.black),
            ),
            onPressed: switchScreen,
            label: const Text("Start Quiz!"),
          )
        ],
      ),
    );
  }
}
