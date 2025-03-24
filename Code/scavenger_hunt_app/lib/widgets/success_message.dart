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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // Center the content vertically
      children: [
        Text(
          "Correct!",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        SizedBox(height: 20),
        if (imagePath != null) ...[
          Image.asset(
            imagePath!,
            width: 300, // Consistent image size
            height: 250,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
        ],
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
              ),
            ],
          ),
          padding: const EdgeInsets.all(16.0),
          child: Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.green,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 30), // Add space between content and next button
        ElevatedButton(
          onPressed: onNext,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(12), // Rounded corners for button
            ),
          ),
          child: Text(
            nextButtonText,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
