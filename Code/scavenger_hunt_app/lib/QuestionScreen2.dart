import 'package:flutter/material.dart';
// import 'package:scavenger_hunt_app/QuestionScreen2.dart';

class QuestionScreen2 extends StatefulWidget {
  const QuestionScreen2({super.key});

  @override
  QuestionScreen1State createState() => QuestionScreen1State();
}

class QuestionScreen1State extends State<QuestionScreen2> {
  final TextEditingController _controller = TextEditingController();
  bool _isCorrect = false;

  //fill this in with a correct answer to the question
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
              if (!_isCorrect) ...[
                Text(
                  //change this to a question about pft
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
                    // Navigator.push(context, QuestionScreen)
                  },
                  child: Text('Advance to question 3...'),
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
