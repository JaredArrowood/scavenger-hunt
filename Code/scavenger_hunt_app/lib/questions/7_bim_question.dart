import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/questions/8_capstone_gallery_question.dart';
import 'package:scavenger_hunt_app/question_page.dart';

class BIMQuestion extends StatelessWidget {
  const BIMQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionPage(
      title: 'Question 8: Architecture',
      questionImagePath: 'assets/bim_cropped.png',
      questionText: 'Where construction minds trained with care\n'
          'Plans come to life in the digital air\n'
          'With 44 screens and models so grand\n'
          'Which lab lets students virtually understand?',
      correctAnswer: 'bim',
      successImagePath: 'assets/bim.png',
      successDescription:
          "The MMR Building Information Modeling Laboratory is utilized by construction management students and was specially designed and constructed by our faculty. The lab space consists of 44 4K displays that allow for three-dimensional and computer-generated views of building plans. This allows students and faculty to virtually visit building sites to make assessments, alter plans, and consider concerns like safety and maintenance.",
      questionIndex: 7,
      nextQuestionPage: const CapstoneGalleryQuestion(),
    );
  }
}
