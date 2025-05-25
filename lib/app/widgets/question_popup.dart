import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class QuestionPopup extends StatelessWidget {
  final dynamic question;
  final Function(String) onAnswerSelected;
  final ConfettiController confettiController;

  const QuestionPopup({
    required this.question,
    required this.onAnswerSelected,
    required this.confettiController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text('Pertanyaan Tentang ${question.name}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(question.question),
              const SizedBox(height: 10),
              ...question.options.map((opt) => ElevatedButton(
                    onPressed: () => onAnswerSelected(opt),
                    child: Text(opt),
                  ))
            ],
          ),
        ),
        ConfettiWidget(
          confettiController: confettiController,
          blastDirectionality: BlastDirectionality.explosive,
          shouldLoop: false,
          numberOfParticles: 20,
          colors: const [Colors.red, Colors.green, Colors.blue, Colors.orange],
        ),
      ],
    );
  }
}
