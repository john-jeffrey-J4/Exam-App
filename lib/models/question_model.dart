class QuizQuestions {
  const QuizQuestions(this.text, this.options);

  final String text;
  final List<String> options;

  List<String> getShuffledList() {
    final List<String> shuffledList = options.toList();
    shuffledList.shuffle();
    return shuffledList;
  }
}
