import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/questions/1_chevron_question.dart';
import 'package:scavenger_hunt_app/question_page.dart';

class AtriumBinaryQuestion extends StatelessWidget {
  const AtriumBinaryQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionPage(
      title: 'Question 1: Binary',
      questionImagePath: 'assets/atrium_binary_cropped.jpg',
      questionText: 'Where past and future blend, minds ascend.\n'
          'Between science and study, my secret extends.\n'
          'Across from those who built this grand hall,\n'
          'My numbers await—will you decode them all?\n'
          'I whisper in ones and zeros, hidden in sight.\n'
          'Unravel my code to reveal my might.',
      correctAnswer: '338',
      successImagePath: 'assets/atrium_binary.jpg',
      successDescription:
          "The Cambre Atrium bridges the old and new sections of Patrick F. Taylor Hall, linking classrooms and chemical engineering labs. It is one of three main common spaces and sits near the RoyOMartin Auditorium, the building's largest lecture hall.",
      questionIndex: 0,
      nextQuestionPage: const ChevronQuestion(),
    );
  }
}
