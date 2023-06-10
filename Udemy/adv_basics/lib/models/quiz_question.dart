class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers); // Creates a new list of the existing answers list
    shuffledList.shuffle();

    return shuffledList;
  }
}