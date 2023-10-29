import 'package:adv_basics/models/question_sum_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSum extends StatelessWidget {
  const QuestionSum(this.sumData, {super.key});

  final List<Map<String, Object>> sumData;

  @override
  Widget build(BuildContext context) {
    Color bgAnswerColor;

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: sumData.map((data) {
            if (data['user_answer'] != data['correct_answer']) {
              bgAnswerColor = const Color.fromARGB(255, 235, 113, 154);
            }else {
              bgAnswerColor = const Color.fromARGB(255, 106, 148, 220);
            }
            return QuestionSumRow(data: data,bgColor: bgAnswerColor);
          }).toList(),
        ),
      ),
    );
  }
}
