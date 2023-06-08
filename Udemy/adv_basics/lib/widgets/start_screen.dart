import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(255, 237, 223, 252),
        ),
        const SizedBox(height: 80),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 237, 223, 252)),
        ),
        const SizedBox(height: 30),
        OutlinedButton(
            onPressed: () {},
            child: const Text(
              'Start Quiz',
              style: TextStyle(color: Colors.white),
            )),
      ]),
    );
  }
}
