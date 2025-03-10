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
            height: 250,
            fit: BoxFit.cover
          ),
        ],
        Text(
          questionText,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                height: 2.5, // Increased line height
              ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30), // Space before the input field
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.deepPurple), // Input field border color
            ),
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
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple, // Background color for the button
            foregroundColor: Colors.white, // Text color on the button
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded button corners
            ),
          ),
          child: Text(
            'Submit',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
