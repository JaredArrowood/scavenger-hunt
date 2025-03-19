import 'package:flutter/material.dart';
import 'atrium_binary_question.dart';
import 'chevron_question.dart';
import 'civil_engineering_lab_question.dart';
import 'bim_question.dart';
import 'dow_chem_lab_question.dart';
import 'capstone_gallery_question.dart';
import 'basf_question.dart';
import 'panera_bread_question.dart';
import 'tau_beta_question.dart';
import 'upstairs_car_question.dart';
import 'question_progress.dart';

class QuestionListPage extends StatelessWidget {
  const QuestionListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final questions = [
      {'title': 'Question 1: Binary', 'page': const AtriumBinaryQuestion()},
      {'title': 'Question 2: Location', 'page': const ChevronQuestion()},
      {'title': 'Question 3: Symbol', 'page': const tauBetaQuestion()},
      {'title': 'Question 4: Food', 'page': const PaneraBreadQuestion()},
      {'title': 'Question 5: Science', 'page': const DOWChemQuestion()},
      {'title': 'Question 6: Innovation', 'page': const BASFQuestion()},
      {'title': 'Question 7: Vroom', 'page': const CarQuestion()},
      {'title': 'Question 8: Architecture', 'page': const BIMQuestion()},
      {'title': 'Question 9: Wide Open', 'page': const CapstoneGalleryQuestion()},
      {'title': 'Question 10: Building buildings', 'page': const CivilLabQuestion()},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Question List'),
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
      ),
      body: ListView.separated(
        itemCount: questions.length,
        separatorBuilder: (context, index) => const Divider(
          color: Colors.grey,
          thickness: 1,
          indent: 16,
          endIndent: 16,
        ),
        itemBuilder: (context, index) {
          final isUnlocked = QuestionProgress.isUnlocked(index);

          return ListTile(
            title: Text(
              questions[index]['title'] as String,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isUnlocked ? Colors.black : Colors.grey,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: isUnlocked ? Colors.black54 : Colors.grey,
            ),
            onTap: isUnlocked
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => questions[index]['page'] as Widget,
                      ),
                    );
                  }
                : () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please complete the previous question first.'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
          );
        },
      ),
    );
  }
}
