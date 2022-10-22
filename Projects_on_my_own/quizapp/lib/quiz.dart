// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import './answers.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final int questionIndex;
  final Function answerQuestion;
  final List<Map<String, Object>> questions;

  Quiz({
    @required this.questionIndex,
    @required this.answerQuestion,
    @required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
            () => answerQuestion(
              answer['score'],
            ),
            answer['text'],
          );
        }).toList(),
      ]),
    );
  }
}
