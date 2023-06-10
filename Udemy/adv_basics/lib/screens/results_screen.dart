import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/widgets/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswers, this.restartQuiz, {super.key});

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have answered $numCorrectQuestions questions out of $numTotalQuestions correctly',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(
                summaryData), // Here we need to get the function with the parentesis because we don't want to point to it, but get its returned value.
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: restartQuiz, child: const Text('Restart Quiz!'))
          ],
        ),
      ),
    );
  }
}
