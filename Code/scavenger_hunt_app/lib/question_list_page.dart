import 'package:flutter/material.dart';
import 'package:scavenger_hunt_app/color_palette.dart';
import 'package:scavenger_hunt_app/question_progress.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:ui'; // For blur effect
import 'question_index.dart';

class QuestionListPage extends StatefulWidget {
  const QuestionListPage({super.key});

  @override
  State<QuestionListPage> createState() => _QuestionListPageState();
}

class _QuestionListPageState extends State<QuestionListPage> {
  @override
  Widget build(BuildContext context) {
    final questions = [
      {'title': 'Question 1: Binary', 'page': const AtriumBinaryQuestion()},
      {'title': 'Question 2: Location', 'page': const ChevronQuestion()},
      {'title': 'Question 3: Symbol', 'page': const TauBetaQuestion()},
      {'title': 'Question 4: Food', 'page': const PaneraBreadQuestion()},
      {'title': 'Question 5: Science', 'page': const DOWChemQuestion()},
      {'title': 'Question 6: Innovation', 'page': const BASFQuestion()},
      {'title': 'Question 7: Vroom', 'page': const CarQuestion()},
      {'title': 'Question 8: Architecture', 'page': const BIMQuestion()},
      {
        'title': 'Question 9: Wide Open',
        'page': const CapstoneGalleryQuestion()
      },
      {'title': 'Question 10: Building', 'page': const CivilLabQuestion()},
    ];

    // Calculate progress
    int completedCount =
        QuestionProgress.completed.where((isComplete) => isComplete).length;
    double progressPercentage = completedCount / questions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Question List'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              BrandColors.lightGold.withOpacity(0.4),
            ],
          ),
        ),
        child: Column(
          children: [
            // Progress Header Card - Keep as is
            Container(
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              decoration: BoxDecoration(
                color: BrandColors.officialPurple,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: BrandColors.corpPurple.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.explore,
                              color: BrandColors.officialGold,
                              size: 24,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Your Progress',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: BrandColors.officialGold,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '$completedCount of ${questions.length}',
                            style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    LinearPercentIndicator(
                      lineHeight: 16.0,
                      percent: progressPercentage,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      progressColor: BrandColors.officialGold,
                      barRadius: const Radius.circular(8),
                      padding: EdgeInsets.zero,
                      animation: true,
                      animationDuration: 1000,
                      center: Text(
                        '${(progressPercentage * 100).toInt()}%',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      completedCount == questions.length
                          ? 'Congratulations! You completed the hunt!'
                          : 'Keep exploring to complete your journey!',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Question List with blurred locked questions
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: questions.length,
                separatorBuilder: (context, index) => const Divider(
                  color: Color(0xFFEAEAEA),
                  thickness: 1,
                  indent: 68,
                  endIndent: 16,
                ),
                itemBuilder: (context, index) {
                  final isUnlocked = QuestionProgress.isUnlocked(index);
                  final isCompleted = QuestionProgress.completed[index];

                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: isCompleted
                          ? BrandColors.lightGold.withOpacity(0.4)
                          : isUnlocked
                              ? Colors.white
                              : Colors.grey.shade100,
                      border: isCompleted
                          ? Border.all(color: BrandColors.corpGold, width: 1.5)
                          : null,
                      boxShadow: isUnlocked
                          ? [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              )
                            ]
                          : null,
                    ),
                    child: Stack(
                      children: [
                        // Normal ListTile
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isCompleted
                                  ? BrandColors.officialGold
                                  : isUnlocked
                                      ? BrandColors.officialPurple
                                      : Colors.grey.shade300,
                            ),
                            child: Center(
                              child: isCompleted
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 24,
                                    )
                                  : Text(
                                      '${index + 1}',
                                      style: TextStyle(
                                        color: isUnlocked
                                            ? Colors.white
                                            : Colors.grey.shade500,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                            ),
                          ),
                          title: Text(
                            questions[index]['title'] as String,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: isCompleted
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                              color: isUnlocked
                                  ? isCompleted
                                      ? BrandColors.corpPurple
                                      : Colors.black87
                                  : Colors.grey,
                            ),
                          ),
                          trailing: isCompleted
                              ? Icon(
                                  Icons.verified,
                                  color: BrandColors.corpGold,
                                  size: 24,
                                )
                              : Icon(
                                  isUnlocked
                                      ? Icons.arrow_forward_ios
                                      : Icons.lock,
                                  size: isUnlocked ? 18 : 20,
                                  color: isUnlocked
                                      ? BrandColors.officialPurple
                                          .withOpacity(0.6)
                                      : Colors.grey.shade400,
                                ),
                          onTap: isUnlocked
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          questions[index]['page'] as Widget,
                                    ),
                                  ).then((_) {
                                    // This refreshes the UI when returning to this page
                                    setState(() {});
                                  });
                                }
                              : () {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                        'Please complete the previous question first.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                      backgroundColor: BrandColors.corpPurple,
                                      duration: const Duration(seconds: 2),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      margin: const EdgeInsets.all(12),
                                    ),
                                  );
                                },
                        ),

                        // Blur overlay for locked questions
                        if (!isUnlocked)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                              child: Container(
                                height:
                                    72, // Match ListTile height with padding
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: null,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
