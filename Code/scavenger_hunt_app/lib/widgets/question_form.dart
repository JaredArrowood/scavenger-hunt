import 'package:flutter/material.dart';

class QuestionForm extends StatelessWidget {
  final String? imagePath;
  final String questionText;
  final bool showError;
  final TextEditingController controller;
  final VoidCallback onSubmit;

  const QuestionForm({
    super.key,
    this.imagePath,
    required this.questionText,
    required this.showError,
    required this.controller,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (imagePath != null) ...[
          Image.asset(
            imagePath!,
            width: 300,
            height: 300,
          ),
        ],
        Text(
          questionText,
          style: TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter your answer',
            errorText: showError ? 'Incorrect answer, try again' : null,
          ),
        ),
        SizedBox(height: 20),
        if (showError) ...[
          Text(
            'That\'s not quite right. Try again!',
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
          SizedBox(height: 10),
        ],
        ElevatedButton(
          onPressed: onSubmit,
          child: Text('Submit'),
        ),
      ],
    );
  }
}
