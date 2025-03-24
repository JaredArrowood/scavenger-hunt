import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/final_page.dart';
import 'package:scavenger_hunt_app/question_page.dart';

class CivilLabQuestion extends StatelessWidget {
  const CivilLabQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionPage(
      title: 'Question 10: Building',
      questionImagePath: 'assets/civil_lab_cropped.png',
      questionText: 'Where strength is tested, both soil and stone,\n'
          'From concrete to timber, all are shown.\n'
          'In labs where students work and design,\n'
          'Which field of engineering do they define?',
      correctAnswer: 'civil engineering',
      successImagePath: 'assets/civil_lab.png',
      successDescription:
          "In this section of Patrick F. Taylor Hall, you will find most of our civil engineering student labs. Here, our students test concrete for strength and damage, test and create asphalt, test the chemical composition and strength of soils, and study the strength of metal and timber.",
      questionIndex: 9,
      nextQuestionPage: const FinalPage(),
      nextButtonText: 'Next Screen...',
    );
  }
}
