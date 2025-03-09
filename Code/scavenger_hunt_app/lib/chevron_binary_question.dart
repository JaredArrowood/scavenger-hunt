import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/QuestionScreen3.dart';
import 'package:scavenger_hunt_app/widgets/question_form.dart';
import 'package:scavenger_hunt_app/widgets/success_message.dart';

class ChevronBinaryQuestion extends StatefulWidget {
  const ChevronBinaryQuestion({super.key});

  @override
  State<ChevronBinaryQuestion> createState() => _ChevronBinaryQuestionState();
}

class _ChevronBinaryQuestionState extends State<ChevronBinaryQuestion> {
  final TextEditingController _controller = TextEditingController();
  bool _isCorrect = false;
  bool _showError = false; // Add this line

  //fill this in with a correct answer to the question
  void _checkAnswer() {
    if (_controller.text.toLowerCase() == 'correct answer') {
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
        title: Text('Binary 2'),
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
                    imagePath: 'assets/chevron_binary_cropped.png',
                    questionText:
                        'In this space where learning thrives,\n'
                        'Technology and tools help dreams arrive.\n'
                        'With printers large and gadgets galore,\n'
                        'Students build, create, and explore.\n'
                        'A place for words, for speech, for sight,\n'
                        'Where tech and learning take their flight.\n'
                        'If you seek to rise, then here you stand,\n'
                        'With tools and knowledge at your hand.\n'
                        'Find me where communication is key,\n'
                        'What is this space that sets you free?',
                    showError: _showError,
                    controller: _controller,
                    onSubmit: _checkAnswer,
                  ),
                if (_isCorrect)
                  SuccessMessage(
                    imagePath: 'assets/chevron_binary.png',
                    description:
                        "The Chevron Center for Engineering Education is a cool spot that helps students improve their communication skills in different ways—whether it's writing, speaking, visual communication, or using technology. It's part of a program called Communication Across the Curriculum, which gives students access to resources like 3D printers, large format printers, and various tech tools to help with their class projects. If students complete the right courses and build a senior portfolio, they can graduate as Distinguished Communicators. The Chevron Center plays a big role in making this happen and helping students stand out!",
                    onNext: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuestionScreen3()),
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
