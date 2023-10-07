class QuizQuestions{
  final String text;
  final List<String> answers;

  QuizQuestions(this.text,this.answers);

  List<String> getShuffledAnswer() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
}
}