import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/color_palette.dart';
import 'package:scavenger_hunt_app/widgets/question_form.dart';
import 'package:scavenger_hunt_app/widgets/success_message.dart';
import 'package:scavenger_hunt_app/question_progress.dart';
import 'package:scavenger_hunt_app/navigation_wrapper.dart';

class QuestionPage extends StatefulWidget {
  final String title;
  final String questionImagePath;
  final String questionText;
  final String correctAnswer;
  final String successImagePath;
  final String successDescription;
  final int questionIndex;
  final Widget nextQuestionPage;
  final String nextButtonText;

  const QuestionPage({
    super.key,
    required this.title,
    required this.questionImagePath,
    required this.questionText,
    required this.correctAnswer,
    required this.successImagePath,
    required this.successDescription,
    required this.questionIndex,
    required this.nextQuestionPage,
    this.nextButtonText = 'Advance to the next question...',
  });

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final TextEditingController _controller = TextEditingController();
  bool _isCorrect = false;
  bool _showError = false;

  void _checkAnswer() {
    if (_controller.text.toLowerCase() == widget.correctAnswer.toLowerCase()) {
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
        title: Text(widget.title),
        backgroundColor: BrandColors.officialPurple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const NavigationWrapper(initialIndex: 0)),
              (route) => false,
            );
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: BrandColors.lightGold,
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (!_isCorrect)
                    QuestionForm(
                      imagePath: widget.questionImagePath,
                      questionText: widget.questionText,
                      showError: _showError,
                      controller: _controller,
                      onSubmit: _checkAnswer,
                    ),
                  if (_isCorrect)
                    SuccessMessage(
                      imagePath: widget.successImagePath,
                      description: widget.successDescription,
                      nextButtonText: widget.nextButtonText,
                      onNext: () {
                        QuestionProgress.markComplete(widget.questionIndex);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => widget.nextQuestionPage),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
