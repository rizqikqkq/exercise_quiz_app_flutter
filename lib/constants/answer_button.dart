import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.answers,
  });

  final String answerText;
  final void Function() answers;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: answers,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
