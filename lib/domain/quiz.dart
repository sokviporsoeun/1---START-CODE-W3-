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