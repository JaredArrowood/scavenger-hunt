import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/color_palette.dart';
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
  bool _displayHint = false;

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

  void _toggleHint() {
    setState(() {
      _displayHint = true;
    });
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
                  if (!_isCorrect) ...[
                    // Always show the image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        widget.questionImagePath,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Show either the hint button or the question and answer field
                    if (_displayHint) ...[
                      // Question Text
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            widget.questionText,
                            style: const TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Answer input field

                      TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          labelText: 'Enter your answer',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorText: _showError
                              ? 'Incorrect answer. Try again!'
                              : null,
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Submit button
                      ElevatedButton(
                        onPressed: _checkAnswer,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: BrandColors.officialPurple,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 32,
                          ),
                        ),
                        child: const Text(
                          'Submit Answer',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ] else
                      // Show the "Need a hint?" button
                      ElevatedButton.icon(
                        onPressed: _toggleHint,
                        icon: const Icon(Icons.lightbulb_outline),
                        label: const Text(
                          "Need a hint?",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: BrandColors.officialGold,
                          foregroundColor: Colors.black87,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 24,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    if (!_displayHint)
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Column(
                          children: [
                            TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                labelText: 'Enter your answer',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorText: _showError
                                    ? 'Incorrect answer. Try again!'
                                    : null,
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Submit button
                            ElevatedButton(
                              onPressed: _checkAnswer,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: BrandColors.officialPurple,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 32,
                                ),
                              ),
                              child: const Text(
                                'Submit Answer',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],

                  // Show success message when correct
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
