class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledOptions() {
    final List<String> shuffledOptions = answers.toList();
    shuffledOptions.shuffle();
    return shuffledOptions;
  }
}
