import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/questions/7_bim_question.dart';
import 'package:scavenger_hunt_app/question_page.dart';

class CarQuestion extends StatelessWidget {
  const CarQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionPage(
      title: 'Question 7: Vroom',
      questionImagePath: 'assets/pft_car_cropped.png',
      questionText: 'In a world of speed, I\'m built to last,\n'
          'Still to be designed with wheels so fast,\n'
          'From the lab to the street, my name is key,\n'
          'What brand am I, can you guess me?',
      correctAnswer: 'ford',
      successImagePath: 'assets/pft_car.jpg',
      successDescription:
          "You've found the car! The Civil Engineering Driving Simulator Laboratory allows students and faculty to research driving behaviors, environments, and traffic. Equipped with multiple screens, projectors, and blackout curtains, this lab gives our researchers the ability to test drive on new roadways and study drivers' reactions to unexpected obstacles and events",
      questionIndex: 6,
      nextQuestionPage: const BIMQuestion(),
      nextButtonText: 'Advance to the next question...',
    );
  }
}
