import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/questions/6_upstairs_car_question.dart';
import 'package:scavenger_hunt_app/question_page.dart';

class BASFQuestion extends StatelessWidget {
  const BASFQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionPage(
      title: 'Question 6: Innovation',
      questionImagePath: 'assets/basf_cropped.png',
      questionText: 'Where biology sparks and ideas grow,\n'
          'Engineers shape the world we know.\n'
          'From research to practice, solving with care,\n'
          'A future of progress is crafted here.\n'
          'In Room 1154, where learning won\'t stop,\n'
          'Which company am I, that stands at the top?',
      correctAnswer: 'basf',
      successImagePath: 'assets/basf.png',
      successDescription:
          "You've found the BASF Living Lab! The BASF Sustainable Living Laboratory was funded by a \$1 million donation from BASF. The flooring, paint, and ceiling in this lab are all made from BASF products. The lab space is dedicated to research investigating sustainable solutions to meet global challenges.",
      questionIndex: 5,
      nextQuestionPage: const CarQuestion(),
    );
  }
}
