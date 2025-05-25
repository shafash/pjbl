import 'dart:math';

class MathQuestion {
  final String question;
  final int answer;
  final List<int> options;

  MathQuestion(this.question, this.answer, this.options);

  static MathQuestion generate() {
    final rand = Random();
    int a = rand.nextInt(10) + 1;
    int b = rand.nextInt(10) + 1;
    int type = rand.nextInt(4); // 0=tambah, 1=kurang, 2=kali, 3=bagi

    String qText;
    int ans;

    switch (type) {
      case 0:
        qText = "$a + $b = ?";
        ans = a + b;
        break;
      case 1:
        qText = "$a - $b = ?";
        ans = a - b;
        break;
      case 2:
        qText = "$a × $b = ?";
        ans = a * b;
        break;
      case 3:
        int temp = a * b; // agar habis dibagi
        qText = "$temp ÷ $a = ?";
        ans = temp ~/ a;
        break;
      default:
        qText = "$a + $b = ?";
        ans = a + b;
    }

    // Generate 3 option palsu + jawaban benar
    Set<int> optionSet = {ans};
    while (optionSet.length < 4) {
      int fake = ans + rand.nextInt(11) - 5;
      if (fake != ans && fake >= 0) optionSet.add(fake);
    }

    return MathQuestion(qText, ans, optionSet.toList()..shuffle());
  }
}
