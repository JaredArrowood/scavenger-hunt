import 'package:flutter/material.dart';

class QuestionScreen1 extends StatefulWidget {
  const QuestionScreen1({super.key});

  @override
  QuestionScreen1State createState() => QuestionScreen1State();
}

class QuestionScreen1State extends State<QuestionScreen1> {
  final TextEditingController _controller = TextEditingController();
  bool _isCorrect = false;

  void _checkAnswer() {
    if (_controller.text.toLowerCase() == 'correct answer') {
      setState(() {
        _isCorrect = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question 1'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'What is the correct answer?',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your answer',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _checkAnswer,
                child: Text('Submit'),
              ),
              if (_isCorrect) ...[
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the next screen
                  },
                  child: Text('Next Screen'),
                ),
                SizedBox(height: 10),
                Text(
                  'You got the question correct!',
                  style: TextStyle(color: Colors.green, fontSize: 18),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
