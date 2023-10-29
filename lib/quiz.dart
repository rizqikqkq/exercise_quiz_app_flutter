import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/result_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;
  var activeScreenT = 'start-screen';

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(
      () {
        //activeScreen = QuestionScreen(onSelectAnswer: chooseAnswer);
        if (activeScreenT == 'result-screen') {
          selectedAnswers = [];
          activeScreenT = 'starting-screen';
        } else {
          activeScreenT = 'questioning-screen';
        }
      },
    );
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreenT = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    switch (activeScreenT) {
      case 'questioning-screen':
        screenWidget = QuestionScreen(
          onSelectAnswer: chooseAnswer,
        );
        break;
      case 'result-screen':
        screenWidget = ResultScreen(
          switchScreen,
          chooseAnswer: selectedAnswers,
        );
        break;
      case 'starting-screen':
        screenWidget = StartScreen(
          switchScreen,
        );
        break;
    }

    // if (activeScreenT == 'questioning-screen') {
    //   screenWidget = QuestionScreen(
    //     onSelectAnswer: chooseAnswer,
    //   );
    // }

    // if (activeScreenT == 'result-screen') {
    //   screenWidget = ResultScreen(
    //     switchScreen,
    //     chooseAnswer: selectedAnswers,
    //   );
    // }

    // if (activeScreenT == 'starting-screen') {
    //   screenWidget = StartScreen(
    //     switchScreen,
    //   );
    // }

    return MaterialApp(
      title: 'Starting Quiz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.purple,
                  Colors.deepPurple,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            // child: activeScreen,
            child: screenWidget),
      ),
    );
  }
}
