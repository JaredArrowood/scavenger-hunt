import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/final_page.dart';
import 'package:scavenger_hunt_app/widgets/question_form.dart';
import 'package:scavenger_hunt_app/widgets/success_message.dart';

class CivilLabQuestion extends StatefulWidget {
  const CivilLabQuestion({super.key});

  @override
  State<CivilLabQuestion> createState() => CivilLabQuestionState();
}

class CivilLabQuestionState extends State<CivilLabQuestion> {
  final TextEditingController _controller = TextEditingController();
  bool _isCorrect = false;
  bool _showError = false;

  void _checkAnswer() {
    if (_controller.text.toLowerCase() == 'civil engineering') {
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
        title: Text('Question 10: Building buildings?'),
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
                    imagePath: 'assets/civil_lab_cropped.png',
                    questionText:
                        'Where strength is tested, both soil and stone,\n'
                        'From concrete to timber, all are shown.\n'
                        'In labs where students work and design,\n'
                        'Which field of engineering do they define?\n',
                    showError: _showError,
                    controller: _controller,
                    onSubmit: _checkAnswer,
                  ),
                if (_isCorrect)
                  SuccessMessage(
                    imagePath: 'assets/civil_lab.png',
                    description:
                        "In this section of Patrick F. Taylor Hall, you will find most of our civil engineering student labs. Here, our students test concrete for strength and damage, test and create asphalt, test the chemical composition and strength of soils, and study the strength of metal and timber.",
                    nextButtonText: 'Next Screen...',
                    onNext: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FinalPage()),
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
