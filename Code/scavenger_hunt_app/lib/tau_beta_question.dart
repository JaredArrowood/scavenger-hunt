import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/panera_bread_question.dart';
import 'package:scavenger_hunt_app/widgets/question_form.dart';
import 'package:scavenger_hunt_app/widgets/success_message.dart';
import 'package:scavenger_hunt_app/question_progress.dart';
import 'package:scavenger_hunt_app/navigation_wrapper.dart';

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
    if (_controller.text.toLowerCase() == 'tau beta pi') {
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
        backgroundColor: const Color.fromARGB(255, 70, 29, 124),
        title: Text('Question 3: Symbol'),
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
                    imagePath: 'assets/tau_beta_cropped.jpg',
                    questionText: "In halls where scholars rise,\n"
                        "A distinction rare, a badge of pride.\n"
                        "At LSU, where it first took its stand,\n"
                        "A legacy built with an honored hand.\n"
                        "What is this group that sets the bar high,\n"
                        "Keeps the spirit alive, reaching the sky?",
                    showError: _showError,
                    controller: _controller,
                    onSubmit: _checkAnswer,
                  ),
                if (_isCorrect)
                  SuccessMessage(
                    imagePath: 'assets/tau_beta.jpg',
                    description:
                        "Congratulations! You have finished!\nTau Beta Pi is a prestigious engineering honor society founded in 1885, recognizing students and alumni for academic excellence and strong character in the engineering field. With chapters at universities across the U.S., it promotes a spirit of culture and achievement in engineering.",
                    onNext: () {
                      QuestionProgress.markComplete(2); // pass appropriate index: Question 2                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaneraBreadQuestion()),
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
