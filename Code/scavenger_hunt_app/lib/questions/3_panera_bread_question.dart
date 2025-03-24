import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/questions/4_dow_chem_lab_question.dart';
import 'package:scavenger_hunt_app/question_page.dart';

class PaneraBreadQuestion extends StatelessWidget {
  const PaneraBreadQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionPage(
      title: 'Question 4: Food',
      questionImagePath: 'assets/panera_cropped.png',
      questionText: 'In a cozy spot where soups are hot,\n'
          'I bake fresh bread right on the spot.\n'
          'A place to gather, relax, and dine,\n'
          'A haven for students, a place divine.\n'
          'With coffee, bowls, and treats to share,\n'
          'What am I? You\'ll find me there!',
      correctAnswer: 'panera bread',
      successImagePath: 'assets/panera.jpg',
      successDescription:
          "Panera Bread is a popular bakery-cafe chain known for its fresh bread, soups, salads, and pastries. It provides a comfortable and inviting atmosphere for students to study, socialize, and enjoy delicious meals. With its commitment to quality ingredients and a welcoming environment, Panera Bread has become a favorite spot for many.",
      questionIndex: 3,
      nextQuestionPage: const DOWChemQuestion(),
      nextButtonText: 'Advance to the next question...',
    );
  }
}
