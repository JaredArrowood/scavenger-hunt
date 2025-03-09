import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/QuestionScreen1.dart';
import 'package:scavenger_hunt_app/atrium_binary_question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PFT Scavenger Hunt',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'PFT Scavenger Hunt'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void navigateToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AtriumBinaryQuestion()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/PFT.jpg'),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                'Welcome to your PFT Scavenger Hunt! Press the start button to begin!',
                style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                navigateToNextScreen();
              },
              child: const Text('Start'),
            ),
          ],
        ),
      ),
    );
  }
}
