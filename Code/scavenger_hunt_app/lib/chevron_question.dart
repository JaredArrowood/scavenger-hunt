import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/tau_beta_question.dart';
import 'package:scavenger_hunt_app/widgets/question_form.dart';
import 'package:scavenger_hunt_app/widgets/success_message.dart';

class ChevronQuestion extends StatefulWidget {
  const ChevronQuestion({super.key});

  @override
  State<ChevronQuestion> createState() => _ChevronQuestionState();
}

class _ChevronQuestionState extends State<ChevronQuestion> {
  final TextEditingController _controller = TextEditingController();
  bool _isCorrect = false;
  bool _showError = false; // Add this line

  //fill this in with a correct answer to the question
  void _checkAnswer() {
    if (_controller.text.toLowerCase() == 'chevron center') {
      setState(() {
        _isCorrect = true;
        _showError = false;
      });
    } else {
      setState(() {
        _showError = true; // Show error on wrong answer
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question 2: Location'),
        backgroundColor: Colors.lightBlueAccent,
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
                    imagePath: 'assets/chevron_cropped.png',
                    questionText: 'In this space where learning thrives,\n'
                        'Technology and tools help dreams arrive.\n'
                        'With printers large and gadgets galore,\n'
                        'Students build, create, and explore.\n'
                        'Find me where communication is key,\n'
                        'What is this space that sets you free?',
                    showError: _showError,
                    controller: _controller,
                    onSubmit: _checkAnswer,
                  ),
                if (_isCorrect)
                  SuccessMessage(
                    imagePath: 'assets/chevron.png',
                    description:
                        "The Chevron Center helps students enhance communication skills and provides resources like 3D printers for class projects. Students who complete required courses and a portfolio can graduate as Distinguished Communicators.",
                    onNext: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tauBetaQuestion()),
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
