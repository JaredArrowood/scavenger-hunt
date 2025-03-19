class QuestionProgress {
  static List<bool> completed = List.filled(10, false);

  static bool isUnlocked(int index) {
    if (index == 0) return true; // Always allow first question
    return completed[index - 1];
  }

  static void markComplete(int index) {
    completed[index] = true;
  }
}
