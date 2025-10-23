class Question{
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int points;
   Question({required this.title, required this.choices, required this.goodChoice, this.points = 1});
}

class Answer{
  final Question question;
  final String answerChoice;
  
  Answer({required this.question, required this.answerChoice});

  bool isGood(){
    return this.answerChoice == question.goodChoice;
  }
}

class Quiz{
  List<Question> questions;
  List <Answer> answers =[];

  Quiz({required this.questions});

  void addAnswer(Answer asnwer) {
     this.answers.add(asnwer);
  }

   int getTotalPoints(){
    int total = 0;
    for (var q in questions) {
      total += q.points;
    }
    return total;
  }

   int getEarnedPoints(){
    int earned = 0;
    for (var answer in answers){
      if (answer.isGood()){
        earned += answer.question.points;
      }
    }
    return earned;
  }

  int getScoreInPercentage(){
    final total = getTotalPoints();
    if (total == 0) return 0;
    final earned = getEarnedPoints();
    return ((earned / total) * 100).toInt();

  }
}

/// Submission represents the result of a player playing the quiz once.
class Submission {
  final String playerName;
  final int earnedPoints;
  final int totalPoints;
  final int percentage;

  Submission({required this.playerName, required this.earnedPoints, required this.totalPoints, required this.percentage});
}

/// Game manages multiple players' submissions and keeps the last score per player.
class Game {
  final List<Question> questions;
  final Map<String, Submission> lastScores = {};

  Game({required this.questions});

  /// Submit a list of answers for a player. Answers should reference the questions from this game.
  Submission submitAnswers(String playerName, List<Answer> answers) {
    final quiz = Quiz(questions: questions);
    for (var a in answers) {
      quiz.addAnswer(a);
    }

    final earned = quiz.getEarnedPoints();
    final total = quiz.getTotalPoints();
    final percentage = quiz.getScoreInPercentage();

    final submission = Submission(playerName: playerName, earnedPoints: earned, totalPoints: total, percentage: percentage);
    lastScores[playerName] = submission; // if exists
    return submission;
  }

  /// Helper to get all last submissions
  List<Submission> getAllSubmissions() => lastScores.values.toList();
}