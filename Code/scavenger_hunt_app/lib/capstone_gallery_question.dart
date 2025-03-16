import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/civil_engineering_lab_question.dart';
import 'package:scavenger_hunt_app/widgets/question_form.dart';
import 'package:scavenger_hunt_app/widgets/success_message.dart';

class CapstoneGalleryQuestion extends StatefulWidget {
  const CapstoneGalleryQuestion({super.key});

  @override
  State<CapstoneGalleryQuestion> createState() =>
      CapstoneGalleryQuestionState();
}

class CapstoneGalleryQuestionState extends State<CapstoneGalleryQuestion> {
  final TextEditingController _controller = TextEditingController();
  bool _isCorrect = false;
  bool _showError = false;

  void _checkAnswer() {
    if (_controller.text.toLowerCase() == 'capstone gallery') {
      setState(() {
        _isCorrect = true;
        _showError = false;
      });
    } else {
      setState(() {
        _showError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question 9: Wide Open Spaces!'),
        backgroundColor: const Color.fromARGB(255, 70, 29, 124),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (!_isCorrect)
                  QuestionForm(
                    imagePath: 'assets/capstone_gallery_cropped.png',
                    questionText:
                        'Where engineers learn and ideas take flight\n'
                        'In a building so grand, reaching new height\n'
                        'With classrooms and labs that shine bright as gold,\n'
                        'Which hall holds the future, as stories unfold?\n',
                    showError: _showError,
                    controller: _controller,
                    onSubmit: _checkAnswer,
                  ),
                if (_isCorrect)
                  SuccessMessage(
                    imagePath: 'assets/capstone_gallery.png',
                    description:
                        " As a result of our recent \$114-million renovation and expansion, this building is now more than 400,000 square feet and provides students and faculty with state-of-the-art classrooms and labs. It also serves as the central hub for the College of Engineering’s eight academic departments, which educate thousands of undergraduate and graduate students each year.",
                    nextButtonText: 'Advance to the next question...',
                    onNext: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CivilLabQuestion()),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
