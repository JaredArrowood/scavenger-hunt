import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/questions/2_tau_beta_question.dart';
import 'package:scavenger_hunt_app/question_page.dart';

class ChevronQuestion extends StatelessWidget {
  const ChevronQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionPage(
      title: 'Question 2: Location',
      questionImagePath: 'assets/chevron_cropped.png',
      questionText: 'In this space where learning thrives,\n'
          'Technology and tools help dreams arrive.\n'
          'With printers large and gadgets galore,\n'
          'Students build, create, and explore.\n'
          'Find me where communication is key,\n'
          'What is this space that sets you free?',
      correctAnswer: 'chevron center',
      successImagePath: 'assets/chevron.png',
      successDescription:
          "The Chevron Center helps students enhance communication skills and provides resources like 3D printers for class projects. Students who complete required courses and a portfolio can graduate as Distinguished Communicators.",
      questionIndex: 1,
      nextQuestionPage: const TauBetaQuestion(),
    );
  }
}
