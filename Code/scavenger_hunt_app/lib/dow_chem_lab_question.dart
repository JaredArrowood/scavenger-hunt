import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/basf_question.dart';
import 'package:scavenger_hunt_app/widgets/question_form.dart';
import 'package:scavenger_hunt_app/widgets/success_message.dart';

class DOWChemQuestion extends StatefulWidget {
  const DOWChemQuestion({super.key});

  @override
  State<DOWChemQuestion> createState() => DOWQuestionState();
}

class DOWQuestionState extends State<DOWChemQuestion> {
  final TextEditingController _controller = TextEditingController();
  bool _isCorrect = false;
  bool _showError = false; // Add this line

  //fill this in with a correct answer to the question
  void _checkAnswer() {
    if (_controller.text.toLowerCase() == 'dow') {
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
        title: Text('Question 5: Science!'),
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
                    imagePath: 'assets/dow_cropped.png',
                    questionText: 'Where chemicals mix and equations align,\n'
                        'Engineers craft designs so fine.\n'
                        'Pipes and pumps, reactions in sight,\n'
                        'Turning ideas into futures bright.\n'
                        'In Room 1114, where science is bliss,\n'
                        'Which company am I, that sponsors all this?\n',
                    showError: _showError,
                    controller: _controller,
                    onSubmit: _checkAnswer,
                  ),
                if (_isCorrect)
                  SuccessMessage(
                    imagePath: 'assets/dow.png',
                    description:
                        "You've found the DOW Chemical Unit Operations Lab! The Dow Chemical Unit Operations Laboratory is a learning lab housed within the Cain Department of Chemical Engineering. It contains various pieces of equipment that are designed to complete specific unit operations.",
                    onNext: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BASFQuestion()),
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
