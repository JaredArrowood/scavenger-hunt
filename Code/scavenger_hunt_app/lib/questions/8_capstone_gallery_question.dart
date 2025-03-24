import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/questions/9_civil_engineering_lab_question.dart';
import 'package:scavenger_hunt_app/question_page.dart';

class CapstoneGalleryQuestion extends StatelessWidget {
  const CapstoneGalleryQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionPage(
      title: 'Question 9: Wide Open',
      questionImagePath: 'assets/capstone_gallery_cropped.png',
      questionText: 'Where engineers learn and ideas take flight\n'
          'In a building so grand, reaching new height\n'
          'With classrooms and labs shine bright as gold,\n'
          'Which hall holds the future, as stories unfold?',
      correctAnswer: 'capstone gallery',
      successImagePath: 'assets/capstone_gallery.png',
      successDescription:
          " As a result of our recent \$114-million renovation and expansion, this building is now more than 400,000 square feet and provides students and faculty with state-of-the-art classrooms and labs. It also serves as the central hub for the College of Engineering's eight academic departments, which educate thousands of undergraduate and graduate students each year.",
      questionIndex: 8,
      nextQuestionPage: const CivilLabQuestion(),
    );
  }
}
