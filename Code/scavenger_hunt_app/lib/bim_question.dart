import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/capstone_gallery_question.dart';
import 'package:scavenger_hunt_app/widgets/question_form.dart';
import 'package:scavenger_hunt_app/widgets/success_message.dart';
import 'package:scavenger_hunt_app/question_progress.dart';
import 'package:scavenger_hunt_app/navigation_wrapper.dart';

class BIMQuestion extends StatefulWidget {
  const BIMQuestion({super.key});

  @override
  State<BIMQuestion> createState() => BIMQuestionState();
}

class BIMQuestionState extends State<BIMQuestion> {
  final TextEditingController _controller = TextEditingController();
  bool _isCorrect = false;
  bool _showError = false;

  void _checkAnswer() {
    if (_controller.text.toLowerCase() == 'bim') {
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
        title: Text('Question 8: Architecture'),
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
                    imagePath: 'assets/bim_cropped.png',
                    questionText:
                        'Where construction minds trained with care\n'
                        'Plans come to life in the digital air\n'
                        'With 44 screens and models so grand\n'
                        'Which lab lets students virtually understand?',
                    showError: _showError,
                    controller: _controller,
                    onSubmit: _checkAnswer,
                  ),
                if (_isCorrect)
                  SuccessMessage(
                    imagePath: 'assets/bim.png',
                    description:
                        "The MMR Building Information Modeling Laboratory is utilized by construction management students and was specially designed and constructed by our faculty. The lab space consists of 44 4K displays that allow for three-dimensional and computer-generated views of building plans. This allows students and faculty to virtually visit building sites to make assessments, alter plans, and consider concerns like safety and maintenance.",
                    nextButtonText: 'Advance to the next question...',
                    onNext: () {
                      QuestionProgress.markComplete(7); // pass appropriate index: Question 7
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CapstoneGalleryQuestion()),
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
