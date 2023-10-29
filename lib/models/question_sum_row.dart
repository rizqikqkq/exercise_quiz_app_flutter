import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSumRow extends StatelessWidget {
  const QuestionSumRow({super.key, required this.data, required this.bgColor});

  final Map<String, Object> data;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor,
            ),
            child: Text(
              ((data['question_index'] as int) + 1).toString(),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [   
              Text(
                data['question'] as String,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    letterSpacing: .5,
                    fontSize: 14,
                  ),
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                data['user_answer'] as String,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 217, 89, 226),
                    letterSpacing: .5,
                    fontSize: 12,
                  ),
                ),
              ),
              Text(
                data['correct_answer'] as String,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 129, 164, 192),
                    letterSpacing: .5,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
