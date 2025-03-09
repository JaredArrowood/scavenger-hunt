import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/QuestionScreen2.dart';
import 'package:scavenger_hunt_app/widgets/question_form.dart';
import 'package:scavenger_hunt_app/widgets/success_message.dart';

class AtriumBinaryQuestion extends StatefulWidget {
  const AtriumBinaryQuestion({super.key});

  @override
  State<AtriumBinaryQuestion> createState() => _AtriumBinaryQuestionState();
}

class _AtriumBinaryQuestionState extends State<AtriumBinaryQuestion> {
  final TextEditingController _controller = TextEditingController();
  bool _isCorrect = false;
  bool _showError = false; // Add this line

  //fill this in with a correct answer to the question
  void _checkAnswer() {
    if (_controller.text.toLowerCase() == '338') {
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
        title: Text('Binary 1'),
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
                    imagePath: 'assets/atrium_binary_cropped.jpg',
                    questionText:
                        'Where past and future blend, minds ascend.\n\n Between science and study, my secret extends.\n\n Across from those who built this grand hall,\n\n My numbers await—will you decode them all?\n\n I whisper in ones and zeros, hidden in sight.\n\n Unravel my code to reveal my might.',
                    showError: _showError,
                    controller: _controller,
                    onSubmit: _checkAnswer,
                  ),
                if (_isCorrect)
                  SuccessMessage(
                    imagePath: 'assets/atrium_binary.jpg',
                    description:
                        "The Cambre Atrium bridges the old and new sections of Patrick F. Taylor Hall, linking classrooms and chemical engineering labs. It is one of three main common spaces and sits near the RoyOMartin Auditorium, the building's largest lecture hall.",
                    onNext: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuestionScreen2()),
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
