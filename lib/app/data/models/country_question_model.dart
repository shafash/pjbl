class CountryQuestion {
  final String name;
  final Question question;

  CountryQuestion({required this.name, required this.question});
}

class Question {
  final String text;
  final List<String> options;
  final String answer;

  Question({
    required this.text,
    required this.options,
    required this.answer,
  });
}
