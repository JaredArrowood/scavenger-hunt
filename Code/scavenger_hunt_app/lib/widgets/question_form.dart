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
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imagePath!,
                width: 320,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 24),
        ],
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          padding: EdgeInsets.all(20),
          child: Text(
            questionText,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  height: 1.8,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 32),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                spreadRadius: 1,
              ),
            ],
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Your Answer:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple[700],
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.deepPurple[200]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                  ),
                  hintText: 'Type your answer here',
                  errorText: showError ? 'Incorrect answer, try again' : null,
                  contentPadding: EdgeInsets.all(16),
                ),
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              if (showError) ...[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red[200]!),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.error_outline, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'That\'s not quite right. Try again!',
                        style: TextStyle(color: Colors.red[800], fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
              ElevatedButton(
                onPressed: onSubmit,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Submit',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 12),
                    Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
