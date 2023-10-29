import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/models/question_sum.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
    this.retryQuiz, {
    super.key,
    required this.chooseAnswer,
  });
  
  final void Function() retryQuiz;
  final List<String> chooseAnswer;

  List<Map<String, Object>> getSumData() {
    final List<Map<String, Object>> sum = [];

    for (var _iN = 0; _iN < chooseAnswer.length; _iN++) {
      // Get Answer
      sum.add({
        'question_index': _iN,
        'question': questions[_iN].text,
        'correct_answer': questions[_iN].answers[0],
        'user_answer': chooseAnswer[_iN]
      });
    }

    return sum;
  }

  @override
  Widget build(BuildContext context) {
    final sumData = getSumData();
    final numTotQuestion = questions.length;
    final numCorrQuestion = sumData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answerd $numCorrQuestion out of $numTotQuestion questions correctly.',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Colors.white,
                  letterSpacing: .5,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSum(sumData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: retryQuiz,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.restart_alt,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Restart Quiz!',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        letterSpacing: .5,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
