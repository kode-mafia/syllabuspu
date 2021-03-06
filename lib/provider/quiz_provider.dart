import 'package:flutter/widgets.dart';
import 'package:syllabuspu/models/question.dart';
import 'package:syllabuspu/models/quiz_user.dart';
import 'package:syllabuspu/services/quiz_services.dart';

class QuizProvider extends ChangeNotifier {
  int totalTime = 0;
  List<Question> questions = [];
  List<QuizUser> users = [];

  QuizProvider() {
    QuizService.getAllQuestions().then((value) {
      questions = value;
      notifyListeners();
    });

    QuizService.getTotalTime().then((value) {
      totalTime = value;
      notifyListeners();
    });
  }
  Future<void> getAllUsers() async {
    users = await QuizService.getAllUsers();
    notifyListeners();
  }

  Future<void> updateHighScore(int currentScore) async {
    await QuizService.updateHighScore(currentScore);
  }
}
