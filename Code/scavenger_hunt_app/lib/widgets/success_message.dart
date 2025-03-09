import 'package:flutter/material.dart';

class SuccessMessage extends StatelessWidget {
  final String? imagePath;
  final String description;
  final VoidCallback onNext;
  final String nextButtonText;

  const SuccessMessage({
    super.key,
    required this.description,
    required this.onNext,
    this.nextButtonText = 'Next Question',
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Correct!",
          style: TextStyle(fontSize: 30, color: Colors.green),
        ),
        SizedBox(height: 20),
        if (imagePath != null) ...[
          Image.asset(
            imagePath!,
            width: 300,
            height: 300,
          ),
          SizedBox(height: 20),
        ],
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(16.0),
          child: Text(
            description,
            style: TextStyle(fontSize: 15, color: Colors.green),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: onNext,
          child: Text(nextButtonText),
        ),
      ],
    );
  }
}
