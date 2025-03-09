import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/widgets/question_form.dart';
import 'package:scavenger_hunt_app/widgets/success_message.dart';

class QuestionScreen2 extends StatefulWidget {
  const QuestionScreen2({super.key});

  @override
  QuestionScreen2State createState() => QuestionScreen2State();
}

class QuestionScreen2State extends State<QuestionScreen2> {
  final TextEditingController _controller = TextEditingController();
  bool _isCorrect = false;
  bool _showError = false;

  void _checkAnswer() {
    if (_controller.text.toLowerCase() == 'correct answer') {
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
        title: Text('Question 2'),
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
                    //imagePath: 'assets/image.jpg',  // Uncomment and add image path if needed
                    questionText: 'What is the correct answer?',
                    showError: _showError,
                    controller: _controller,
                    onSubmit: _checkAnswer,
                  ),
                if (_isCorrect)
                  SuccessMessage(
                    description: "YOU GOT IT RIGHT... DESCRIPTION...",
                    onNext: () {
                      // Add navigation to next question screen here
                    },
                    nextButtonText: 'Advance to question 3...',
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
