import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/upstairs_car_question.dart';
import 'package:scavenger_hunt_app/widgets/question_form.dart';
import 'package:scavenger_hunt_app/widgets/success_message.dart';
import 'package:scavenger_hunt_app/question_progress.dart';
import 'package:scavenger_hunt_app/navigation_wrapper.dart';

class BASFQuestion extends StatefulWidget {
  const BASFQuestion({super.key});

  @override
  State<BASFQuestion> createState() => BASFQuestionState();
}

class BASFQuestionState extends State<BASFQuestion> {
  final TextEditingController _controller = TextEditingController();
  bool _isCorrect = false;
  bool _showError = false;

  void _checkAnswer() {
    if (_controller.text.toLowerCase() == 'basf') {
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
        title: Text('Question 6: Innovation'),
        backgroundColor: const Color.fromARGB(255, 70, 29, 124),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const NavigationWrapper(initialIndex: 1)),
            );
          },
        ),
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
                    imagePath: 'assets/basf_cropped.png',
                    questionText: 'Where biology sparks and ideas grow,\n'
                        'Engineers shape the world we know.\n'
                        'From research to practice, solving with care,\n'
                        'A future of progress is crafted here.\n'
                        'In Room 1154, where learning won’t stop,\n'
                        'Which company am I, that stands at the top?',
                    showError: _showError,
                    controller: _controller,
                    onSubmit: _checkAnswer,
                  ),
                if (_isCorrect)
                  SuccessMessage(
                    imagePath: 'assets/basf.png',
                    description:
                        "You've found the BASF Living Lab! The BASF Sustainable Living Laboratory was funded by a \$1 million donation from BASF. The flooring, paint, and ceiling in this lab are all made from BASF products. The lab space is dedicated to research investigating sustainable solutions to meet global challenges.",
                    onNext: () {
                      QuestionProgress.markComplete(5); // pass appropriate index: Question 5
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CarQuestion()),
                      );
                    },
                    nextButtonText: 'Advance to the next question...',
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
