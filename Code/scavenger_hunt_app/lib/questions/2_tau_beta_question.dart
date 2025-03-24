import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/questions/3_panera_bread_question.dart';
import 'package:scavenger_hunt_app/question_page.dart';

class TauBetaQuestion extends StatelessWidget {
  const TauBetaQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionPage(
      title: 'Question 3: Symbol',
      questionImagePath: 'assets/tau_beta_cropped.jpg',
      questionText: "In halls where scholars rise,\n"
          "A distinction rare, a badge of pride.\n"
          "At LSU, where it first took its stand,\n"
          "A legacy built with an honored hand.\n"
          "What is this group that sets the bar high,\n"
          "Keeps the spirit alive, reaching the sky?",
      correctAnswer: 'tau beta pi',
      successImagePath: 'assets/tau_beta.jpg',
      successDescription:
          "Congratulations! You have finished!\nTau Beta Pi is a prestigious engineering honor society founded in 1885, recognizing students and alumni for academic excellence and strong character in the engineering field. With chapters at universities across the U.S., it promotes a spirit of culture and achievement in engineering.",
      questionIndex: 2,
      nextQuestionPage: const PaneraBreadQuestion(),
      nextButtonText: 'Advance to the next question...',
    );
  }
}
