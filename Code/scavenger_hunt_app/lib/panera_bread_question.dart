import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/widgets/question_form.dart';
import 'package:scavenger_hunt_app/widgets/success_message.dart';
import 'package:scavenger_hunt_app/dow_chem_lab_question.dart';

class PaneraBreadQuestion extends StatefulWidget {
  const PaneraBreadQuestion({super.key});

  @override
  State<PaneraBreadQuestion> createState() => PaneraQuestionState();
}

class PaneraQuestionState extends State<PaneraBreadQuestion> {
  final TextEditingController _controller = TextEditingController();
  bool _isCorrect = false;
  bool _showError = false; // Add this line

  //fill this in with a correct answer to the question
  void _checkAnswer() {
    if (_controller.text.toLowerCase() == 'panera bread') {
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
        title: Text('Question 4: Location'),
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
                    imagePath: 'assets/panera_cropped.png',
                    questionText: 'In a cozy spot where soups are hot,\n'
                        'I bake fresh bread right on the spot.\n'
                        'A place to gather, relax, and dine,\n'
                        'A haven for students, a place divine.\n'
                        'With coffee, bowls, and treats to share,\n'
                        'What am I? You’ll find me there!\n',
                    showError: _showError,
                    controller: _controller,
                    onSubmit: _checkAnswer,
                  ),
                if (_isCorrect)
                  SuccessMessage(
                    imagePath: 'assets/panera.jpg',
                    description:
                        "Panera Bread is a popular bakery-cafe chain known for its fresh bread, soups, salads, and pastries. It provides a comfortable and inviting atmosphere for students to study, socialize, and enjoy delicious meals. With its commitment to quality ingredients and a welcoming environment, Panera Bread has become a favorite spot for many.",
                    onNext: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DOWChemQuestion()),
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
