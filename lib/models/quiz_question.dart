class QuizQuestion {
  const QuizQuestion(this.text, this.answer);

  final String text;
  final List<String> answer;

  List<String> getShuffledAnswer() {
    final shuffledAnswer = List.of(answer);
    shuffledAnswer.shuffle();
    return shuffledAnswer;
  }
}
