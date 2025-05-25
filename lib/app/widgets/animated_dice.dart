import 'package:flutter/material.dart';

class AnimatedDice extends StatefulWidget {
  final int dice1;
  final int dice2;
  final VoidCallback onRollComplete;

  const AnimatedDice({
    Key? key,
    required this.dice1,
    required this.dice2,
    required this.onRollComplete,
  }) : super(key: key);

  @override
  State<AnimatedDice> createState() => _AnimatedDiceState();
}

class _AnimatedDiceState extends State<AnimatedDice>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  String getDiceEmoji(int value) {
    const diceEmojis = ['⚀', '⚁', '⚂', '⚃', '⚄', '⚅'];
    return diceEmojis[value - 1];
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);

    _controller.forward().whenComplete(() {
      widget.onRollComplete();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Text(
        '${getDiceEmoji(widget.dice1)} ${getDiceEmoji(widget.dice2)}',
        style: const TextStyle(fontSize: 80),
      ),
    );
  }
}
