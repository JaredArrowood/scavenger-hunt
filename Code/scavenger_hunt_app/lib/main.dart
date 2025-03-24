import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/color_palette.dart';
import 'package:scavenger_hunt_app/questions/0_atrium_binary_question.dart';
import 'package:scavenger_hunt_app/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scavenger_hunt_app/question_progress.dart'; // Import for progress
import 'package:scavenger_hunt_app/question_index.dart'; // Import for question pages

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PFT Scavenger Hunt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: BrandColors.officialPurple,
          secondary: BrandColors.officialGold,
          tertiary: Colors.teal,
          surface: Colors.grey[50],
        ),
        scaffoldBackgroundColor: BrandColors.lightGold,
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(
          TextTheme(
            displayLarge: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple[800]),
            displayMedium: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple[700]),
            bodyLarge:
                TextStyle(fontSize: 18, color: Colors.black87, height: 1.5),
            bodyMedium:
                TextStyle(fontSize: 16, color: Colors.black54, height: 1.5),
            titleLarge: TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple[600],
            foregroundColor: Colors.white,
            elevation: 5,
            shadowColor: Colors.deepPurple[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 32),
          ),
        ),
        cardTheme: CardTheme(
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          shadowColor: Colors.black26,
        ),
        appBarTheme: AppBarTheme(
          elevation: 2,
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 70, 29, 124),
          foregroundColor: Colors.white,
          titleTextStyle: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      home: const SplashScreen(),
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
  // Get the current question based on progress
  Widget _getCurrentQuestionPage() {
    // List of all question pages in order
    final List<Widget> questionPages = [
      const AtriumBinaryQuestion(),
      const ChevronQuestion(),
      const TauBetaQuestion(),
      const PaneraBreadQuestion(),
      const DOWChemQuestion(),
      const BASFQuestion(),
      const CarQuestion(),
      const BIMQuestion(),
      const CapstoneGalleryQuestion(),
      const CivilLabQuestion(),
    ];

    // Find the index of the first incomplete question
    int currentIndex = 0;
    for (int i = 0; i < QuestionProgress.completed.length; i++) {
      if (QuestionProgress.completed[i]) {
        currentIndex = i + 1; // Move to the next question
      } else {
        break; // Stop at the first incomplete question
      }
    }

    // Return the current question page (or the first one if none started)
    if (currentIndex >= questionPages.length) {
      // All questions are completed, start over or go to a completion page
      return questionPages[0];
    } else {
      return questionPages[currentIndex];
    }
  }

  // Check if hunt has been started
  bool get _isHuntStarted {
    return QuestionProgress.completed.any((isCompleted) => isCompleted);
  }

  void navigateToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _isHuntStarted
            ? _getCurrentQuestionPage()
            : const AtriumBinaryQuestion(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      'assets/PFT.jpg',
                      height: 350,
                      width: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'Welcome to your PFT Scavenger Hunt!',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _isHuntStarted
                            ? 'Continue your exploration of Patrick F. Taylor Hall!'
                            : 'Explore Patrick F. Taylor Hall and discover its secrets!',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      if (_isHuntStarted) ...[
                        const SizedBox(height: 16),
                        // Show progress indicator
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: BrandColors.officialGold,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${QuestionProgress.completed.where((isComplete) => isComplete).length} of ${QuestionProgress.completed.length} clues solved',
                              style: TextStyle(
                                color: BrandColors.corpPurple,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: navigateToNextScreen,
                  iconAlignment: IconAlignment.end,
                  icon: Icon(
                    _isHuntStarted
                        ? Icons.play_circle
                        : Icons.play_arrow_rounded,
                    size: 28,
                    color: BrandColors.officialGold,
                  ),
                  label: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      _isHuntStarted
                          ? 'Continue Your Hunt'
                          : 'Begin Your Adventure',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: BrandColors.officialPurple,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
