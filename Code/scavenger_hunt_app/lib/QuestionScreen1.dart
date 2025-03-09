import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/QuestionScreen2.dart';
import 'package:scavenger_hunt_app/widgets/question_form.dart';
import 'package:scavenger_hunt_app/widgets/success_message.dart';

class QuestionScreen1 extends StatefulWidget {
  const QuestionScreen1({super.key});

  @override
  QuestionScreen1State createState() => QuestionScreen1State();
}

class QuestionScreen1State extends State<QuestionScreen1> {
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
        title: Text('Question 1'),
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
                    //imagePath: 'assets/PFT.jpg',  // Uncomment and add image path if needed
                    questionText: 'What is the correct answer?',
                    showError: _showError,
                    controller: _controller,
                    onSubmit: _checkAnswer, imagePath: '',
                  ),
                if (_isCorrect)
                  SuccessMessage(
                    description: "YOU GOT IT RIGHT... DESCRIPTION...",
                    onNext: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuestionScreen2()),
                      );
                    },
                    nextButtonText: 'Advance to question 2...',
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
