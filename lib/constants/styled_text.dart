import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.vText, {super.key});

final String vText;

  @override
  Widget build(BuildContext context) {
    return Text(
      vText,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
    );
  }
}
