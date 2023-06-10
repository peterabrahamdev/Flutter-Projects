import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/screens/questions_screen.dart';
import 'package:adv_basics/screens/results_screen.dart';
import 'package:flutter/material.dart';

import '../screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];
  Widget? _activeScreen;

  @override
  void initState() {
    _activeScreen = StartScreen(_switchScreen);
    super.initState();
  }

  void _switchScreen() {
    setState(() {
      _activeScreen = QuestionsScreen(chooseAnswer);
    });
  }

   void _restartScreen() {
    setState(() {
      _selectedAnswers = [];
      _activeScreen = StartScreen(_switchScreen);
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = ResultsScreen(_selectedAnswers, _restartScreen);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ],
            ),
          ),
          child: _activeScreen,
        ),
      ),
    );
  }
}
