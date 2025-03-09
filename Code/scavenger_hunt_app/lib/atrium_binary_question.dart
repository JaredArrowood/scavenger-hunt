import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/QuestionScreen2.dart';

class AtriumBinaryQuestion extends StatefulWidget {
  const AtriumBinaryQuestion({super.key});

  @override
  State<AtriumBinaryQuestion> createState() => _AtriumBinaryQuestionState();
}

class _AtriumBinaryQuestionState extends State<AtriumBinaryQuestion> {
  final TextEditingController _controller = TextEditingController();
  bool _isCorrect = false;
  bool _showError = false; // Add this line

  //fill this in with a correct answer to the question
  void _checkAnswer() {
    if (_controller.text.toLowerCase() == '338') {
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
        title: Text('Binary 1'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (!_isCorrect) ...[
                  Image.asset(
                    'assets/atrium_binary_cropped.jpg',
                    width: 300,
                    height: 300,
                  ),
                  Text(
                    //change this to a question about pft
                    'Where past and future blend, minds ascend.\n\n Between science and study, my secret extends.\n\n Across from those who built this grand hall,\n\n My numbers await—will you decode them all?\n\n I whisper in ones and zeros, hidden in sight.\n\n Unravel my code to reveal my might.',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your answer',
                      errorText: _showError
                          ? 'Incorrect answer, try again'
                          : null, // Add this line
                    ),
                  ),
                  SizedBox(height: 20),
                  if (_showError) ...[
                    // Add this section
                    Text(
                      'That\'s not quite right. Try again!',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                  ],
                  ElevatedButton(
                    onPressed: _checkAnswer,
                    child: Text('Submit'),
                  ),
                ],
                if (_isCorrect) ...[
                  //can also add an image if one is required
                  // Image.asset('assets/PFT.jpg'),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.black, width: 2), // Add border here
                    ),
                    child: Text(
                      "YOU GOT IT RIGHT... DESCRIPTION... ",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors
                              .green), //change this to a description of the answer
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuestionScreen2()));
                    },
                    child: Text('Advance to question 2...'),
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
      ),
    );
  }
}
