import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Icon(
                  Icons.person,
                  size: 80,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 20),
              _buildHelpSection('Getting Started',
                  'Welcome to the LSU Scavenger Hunt App! To begin the hunt, tap on "Begin Your Adventure" from the home screen. Good luck, tiger!'),
              _buildHelpSection('Finding Clues',
                  'Walk around Patrick F. Taylor Hall to find answers for each section.'),
              _buildHelpSection('Submitting Answers',
                  'When prompted to answer a question or complete a challenge, enter your response in the provided field and tap "Submit" to continue to the next clue.'),
              _buildHelpSection('Viewing Progress',
                  'Check your current progress by tapping the "Questions" tab. This will show which clues you\'ve found and how many remain.'),
              _buildHelpSection('Technical Issues',
                  'If you encounter any technical issues, try restarting the app. If problems persist, please contact our support team.'),
              const SizedBox(height: 20),
              _buildContactSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHelpSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.email, color: Colors.deepPurple),
                SizedBox(width: 8),
                Text(
                  'Contact Support',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Need more help? Send us an email at:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                // Add email functionality here if needed
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Opening email client...')),
                );
              },
              child: const Text(
                'joesmoe@lsu.edu',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
