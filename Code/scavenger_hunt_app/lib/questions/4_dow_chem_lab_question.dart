import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/questions/5_basf_question.dart';
import 'package:scavenger_hunt_app/question_page.dart';

class DOWChemQuestion extends StatelessWidget {
  const DOWChemQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionPage(
      title: 'Question 5: Science',
      questionImagePath: 'assets/dow_cropped.png',
      questionText: 'Where chemicals mix and equations align,\n'
          'Engineers craft designs so fine.\n'
          'Pipes and pumps, reactions in sight,\n'
          'Turning ideas into futures bright.\n'
          'In Room 1114, where science is bliss,\n'
          'Which company am I, that sponsors all this?',
      correctAnswer: 'dow',
      successImagePath: 'assets/dow.png',
      successDescription:
          "You've found the DOW Chemical Unit Operations Lab! The Dow Chemical Unit Operations Laboratory is a learning lab housed within the Cain Department of Chemical Engineering. It contains various pieces of equipment that are designed to complete specific unit operations.",
      questionIndex: 4,
      nextQuestionPage: const BASFQuestion(),
      nextButtonText: 'Advance to the next question...',
    );
  }
}
