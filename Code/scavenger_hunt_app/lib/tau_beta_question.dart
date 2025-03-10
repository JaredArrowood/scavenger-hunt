import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/main.dart';
import 'package:scavenger_hunt_app/widgets/question_form.dart';
import 'package:scavenger_hunt_app/widgets/success_message.dart';

class tauBetaQuestion extends StatefulWidget {
  const tauBetaQuestion({super.key});

  @override
  tauBetaQuestionState createState() => tauBetaQuestionState();
}

class tauBetaQuestionState extends State<tauBetaQuestion> {
  final TextEditingController _controller = TextEditingController();
  bool _isCorrect = false;
  bool _showError = false;

  void _checkAnswer() {
    if (_controller.text.toLowerCase() == 'tau beta phi') {
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
        title: Text('Question 3: Symbol'),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyApp()),
                      );
                    },
                    nextButtonText: 'Return Home',
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
